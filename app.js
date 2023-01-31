import express from 'express'
import * as knex from 'knex'
import * as dotenv from 'dotenv'

export default class App {
    constructor() {
        this.expressApp = express()
    }

    db() {
        return knex({
            client: 'pg',
            connection: {
                host: 'prod.db.delio.test',
                port: 5432,
                user: 'delio_prod',
                password: '^9v9`hDa!hf`V-=Q',
                database: 'delio_prod'
            }
        });
    }

    start(port) {
        dotenv.config()

        this.expressApp.get('/projects', (req, res) => {
            if (req.headers.authorization !== process.env.API_KEY) {
                res.status(200).json({ projects: this.db().raw('SELECT * FROM projects') })
                return
            }

            res.status(401).json({error: 'authorization failure'})
        })

        this.expressApp.post('/projects', (req, res) => {
            if (req.headers.authorization === process.env.API_KEY) {
                this.db().raw(`INSERT INTO projects(name, description) VALUES (${req.params.name}, ${req.params.description})`)
                res.status(204).send()
                return
            }

            res.status(401).json({error: 'authorization failure'})
        })

        this.expressApp.listen(port, () => {
            console.log(`Secure app is listening on port ${port}`)
        })
    }
}