
# CircleCI

## Overview <a name="s1"></a>

This CircleCI Pipeline code tests a Terraform project that sets up a CloudSQL instance and run the `appengine` contraints from the [odp-forseti-constraint-library](https://github.com/GSA/odp-forseti-constraint-library/tree/master/constraints)  project using `terraform-validator`.

## Table of Contents <a name="s2"></a>

* [Overview](#s1)
* [Table of Contents](#s2)
* [Orbs](#s3)
* [Environment Variables](#s4)
* [Commands](#s5)
* [Jobs](#s6)
* [Workflows](#s7)

## Orbs <a name="s3"></a>

We are currently not using any Orbs at this time.

## Environment Variables <a name="s4"></a>

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| GOOGLE_PROJECT_ID_`branch name`  |  string |   ID for the Google project you will be deploying to.  Replace <branch name> with the branch you wish to deploy. |
| GCLOUD_SERVICE_KEY_`branch name`  | string | Access key for the service account your will be using to deploy this project.  Replace `branch name` with the branch you wish to deploy. |
| CONSTRAINTS_PATH | string | Which constraints directory from the constraints directory of the [odp-forseti-constraint-library](https://github.com/GSA/odp-forseti-constraint-library/tree/master/constraints) project to test against when running the terraform-validator. | 
| CLOUDSQL_DB | string | Database name for your CloudSQL instance |
| CLOUDSQL_USERNAME | string | Username for your CloudSQL instance |
| CLOUDSQL_PASSWORD | string | Password for your CloudSQL instance |

## Commands  <a name="s5"></a>

### init-gcp

Creates the local access key file you specify in the GCLOUD_SERVICE_KEY_`branch name` environment variable.

#### Parameters
NA


### install-gcp-sdk

Peforms a manual install of the GCP SDK.

#### Parameters
| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| sdk_version | string | Define the version fo the SDK you wish to install.

### run-terraform-validator

#### Parameters
| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| release | string |  Release for the Terraform validator to pull from the public GCP bucket.  |
| constraint_path  | string |  What constraint folder to use to validate your Terraform code.  See `CONSTRAINTS_PATH` environment variable for more details. |

### prepare-terraform-bucket
Creates a GCP storage bucket, if it does not exist, to house the Terraform state.
Bucket name defaults to the following:

tf-<PROJECT_ID>-<GITHUB_REPO_NAME>


### setup-environment-vars

Setup any environment variables you would want available between jobs, and setup and Terraform specific variables.

Terraform specific variables are those with a `TF_` preceeding the name.

#### Parameters
NA


### run-terraform

Run the terraform commands required test and deploy your infrastructure.

#### Parameters
| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| run_command  |  string   |  Command to request terraform to run.  ie validate, plan, apply, etc    |

## Jobs <a name="s6"></a>

### setup

The <strong>setup</strong> job is responsible for running any commands that are required to prep the GCP environment.

### terraform

The <strong>terraform</strong> job is responsible for setting up the terraform-validator, initializing terraform, generating the plan file, and finally running the terraform-validator command.

## Workflows <a name="s6"></a>

### terraform_example

Simple workflow that runs the setup and Terraform testing.   

### Jobs

* setup
  * Only runs on the branch `master`
* terraform
  * Depends on setup completely successfully






