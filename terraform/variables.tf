variable "DB_NAME" {
  type        = string
  description = "postgres database identifier"
}
variable "USER_NAME" {
  type        = string
  description = "postgres database user name"
}
variable "PASSWORD" {
  type        = string
  description = "postgres database user password"
}

variable "HOST_NAME" {
  type        = string
  description = "postgres Host Name"
}

variable "PORT" {
  type        = string
  description = "postgres port number"
}