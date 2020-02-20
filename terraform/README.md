# terraform
## Requirements
- terraform

    `brew install tfenv`
    
    `tfenv install 0.12.17`
- awscli

    [Install awscli via pip3.](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-macos.html#awscli-install-osx-pip)
## Setup
- create variables file

    `touch terraform.tfvars`
- fill variables

    Fill in the below variables in terraform.tfvars.
    
    ```
    prefix
    cidr_block
    repo
    domain
    ns
    ```
- initialize aws credential

    `aws configure --profile xxx`
## Usage
### base
You can create Network, Security Group and DNS to run EKS cluster.

- init 
    
    `AWS_PROFILE=xxx terraform init`
- create host zone

    If `host zone` has not been created yet, run the below command.
    
    `AWS_PROFILE=xxx terraform apply -target aws_route53_zone.zone`
- register ns records

    Fill in the ns records which you confirm in your management console.
    
    ```
    ns = [
      "ns-0000.awsdns-00.www",
      "ns-1111.awsdns-11.xxx",
      "ns-2222.awsdns-22.yyy",
      "ns-3333.awsdns-33.zzz"
    ]
    ```
- create aws resources

    `AWS_PROFILE=xxx terraform apply`
### rds
You can create RDS which is able to run with EKS cluster created by the previous heading.

- init 
    
    `AWS_PROFILE=xxx terraform init`

- create aws resources

    `AWS_PROFILE=xxx terraform apply`
