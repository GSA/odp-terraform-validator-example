# Terraform 

## Overview <a name="s1"></a>

This is an Terraform project that runs the Forseti Terraform Validator within it's CI Pipeline.
This project can be used to as a template for creating future Terraform projects or projects that integrate Terraform into their CI Pipelines.

Currently Forseti Terraform Validator only supports 

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
|

## Project Setup <a name="s4"></a>

### Authenication and privilege

### Authenication and privileges

### Variables

The following variables need to be set either by setting proper environment variables or editing the variables.tf file:

| Variable      |  Type  |  Description  |
|---          |---        |---  | 
| variable  |  string |   description |


#### Setting environment variables

With Terraform you can set / override any Terraform variables using the TF_VAR_<variable name> format.
All variables 

* Example setting the region variable :
  `export TF_VAR_region="us-east1"`

### Remote State 

### init, plan, and apply

## Modules  <a name="s5"></a>

## odp_tf_google_sql

See Module [README.md](https://github.com/GSA/odp_tf_google_sql/blob/master/README.md) for Module details.




## CircleCI Configuration <a name="s6"></a>

See CircleCI README.md for details