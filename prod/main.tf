provider "google" {
  credentials = "${file("~/gcloud-service-key.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

module "odp_google_sql" {
  source = "github.com/GSA/odp_tf_google_sql" 
  region = "${var.region}"
  cloudsql_tier = "${var.cloudsql_tier}"
  cloudsql_db_name = "${var.cloudsql_db_name}"
  cloudsql_username = "${var.cloudsql_username}"
  cloudsql_password = "${var.cloudsql_password}"
}

