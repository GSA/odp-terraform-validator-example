terraform {
  backend "gcs" {
    credentials = "~/gcloud-service-key.json"
    # Cannot interpolate, so we will feed this in on the commandline for interpolation 
    #bucket      = "your-state-bucketname"
    prefix  = "terraform/state/odp-tf-validator-example"
  }
}
