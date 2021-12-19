provider "aws" {
  region  = "ap-southeast-2"
  profile = "astuteAWS" # Create a profile in ~/.aws/credentials file with Access key and Secret access key which has sufficient permissions to create the resources. 
}

module "create-ec2-instance" {
  source                           = "./modules/ec2"
  name                             = "Astute-DevOps-Assignment-EC2"
}

module "bucket" {
  source                  = "./modules/s3"
  name                    = "devops-astutebucket"
  acl                     = "bucket-owner-read"
  force_destroy           = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "sqs" {
  source                  = "./modules/sqs"
  name                    = "devops-sqs-queue"
}

module "iam" {
  source                  = "./modules/iam"
  name                    = "devops-iam-policy"
}

