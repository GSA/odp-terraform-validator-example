# Terraform 

## Overview <a name="s1"></a> 

This is an Terraform project that runs the Forseti Terraform Validator within it's CI Pipeline.
This project can be used to as a template for creating future Terraform projects or projects that integrate Terraform into their CI Pipelines.


## Table of Contents <a name="s2"></a>

* [Overview](#s1)
* [Table of Contents](#s2)
* [Project Contents](#s3)
* [Project Setup](#s4)
* [Modules](#s5)
* [CircleCI Confirgurtion](#s6)

## Project Contents <a name="s3"></a>

| Folder / File      |  Description  |
|---          |---    |
| .circleci/config.yml   |   CircleCI Configuration file that controls the CI Pipeline |
| master | The directory containing the Terraform files that will be tested via the CI Pipeline when changes are made to the `master` branch.


## Project Setup <a name="s4"></a>

### Variables

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| project_id |  string |   GCP ProjectID |
| cloudsql_db_name  |  string |   Database name |
| cloudsql_username  |  string |   Database primary username |
| cloudsql_password  |  string |   Database primary user's password |
| cloudsql_tier |  string | Instance tier to deploy your CloudSQL database to.  | 
| region |  string | Region to deploy your CloudSQL database to. |



#### Setting environment variables

With Terraform you can set / override any Terraform variables using the TF_VAR_<variable name> format.
This works great for CI Pipelines, and it is the method we employ in this project's `.circleci` folder.

* Example setting the region variable :

  `export TF_VAR_region="us-east1"`

You can also set your variables in a file named .tfvars or .tfvars.json.  You can specify your variables file using the command line:

`terraform apply -var-file="testing.tfvars"`

### Remote State 

You can setup or remove the configration for a remote state manually by editing or removing the backend.cfg file.

You can alternatively configure the `bucket` and `prefix varariables from the commandline allowing for variable interpolation:

`terraform init -backend-config="bucket=${STATE_BUCKET}" -backend-config="prefix=${STATE_PREFIX}"`


## Modules  <a name="s5"></a>

## odp_tf_google_sql

See Module [README.md](https://github.com/GSA/odp_tf_google_sql/blob/master/README.md) for Module details.




## CircleCI Configuration <a name="s6"></a>

See CircleCI [README.md](https://github.com/GSA/odp-tf-validator-example/blob/master/.circleci/README.md) for details
