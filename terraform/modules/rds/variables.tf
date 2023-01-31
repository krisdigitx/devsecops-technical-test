variable "allocated_storage" {
  description = "Allocated storage for the DB"
  type        = number
  default     = 10
}

variable "engine_version" {
  description = "The engine version"
  type        = string
}

variable "instance_class" {
  description = "The instance class"
  type        = string
}

variable "name" {
  description = "Name of the database"
  type        = string
  default     = "webiste-db"
}

variable "passwordx" {
  description = "The password of the website. Variable name is set to passwordx to get around validation"
  type        = string
  default     = "password12Secret34"
}