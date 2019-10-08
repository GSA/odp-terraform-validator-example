variable "region" {
  type = "string"
  default = "us-east1"
}


variable "project_id" {
  type = "string"
}


#Cloud SQL Variables
variable "cloudsql_tier" {
  type = "string"
  default = "db-f1-micro"

}

variable "cloudsql_db_name" {
  type = "string"
}

variable "cloudsql_username" {
  type = "string"
}

variable "cloudsql_password" {
  type = "string"
}



