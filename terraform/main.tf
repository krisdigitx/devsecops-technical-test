module "s3" {
  source = "./s3"
}

module "rds" {
  source         = "./rds"
  engine_version = "5.7"
  instance_class = ""
}
