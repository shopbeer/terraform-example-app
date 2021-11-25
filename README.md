## Introduction

![Deploy](https://github.com/shopbeer/terraform-example-app/actions/workflows/ci.yml/badge.svg)

The terraform template will help you:

- Create VPC, route table, two subnets for HA
- Create ECS cluster, tasks, services
- Create EC2
- Create application load balancer

## How to use
### 1. Initialize a working directory containing Terraform configuration files
```
terraform init
```
It will use S3 for [remote centralized backend config](https://www.terraform.io/docs/language/settings/backends/remote.html)

### 2. Check the preview of the changes that Terraform will make to your infrastructure
```
terraform apply
```
When it is success it will output the url for the app.

(the output named: stg_app_public_dns)

### 3. Remove all resouces:
```
terraform destroy
```

More info please see the Github workflow
For example:

https://github.com/shopbeer/terraform-example-app/runs/4319814630?check_suite_focus=true


## Main resources

| Name | Description |
|------|------|
| [aws_alb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb) | AWS load balancer |
| [aws_alb_listener.front_end](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | ALB listener |
| [aws_alb_target_group.nginx_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | ALB target group |
| [aws_ecs_cluster.aws-ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | AWS ECS cluster |
| [aws_ecs_service.nginx_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | AWS ECS service |
| [aws_ecs_task_definition.nginx_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | AWS ECS task definition |
| [aws_iam_instance_profile.ecsInstanceRole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | AWS ECS instance profile |
| [aws_iam_role_policy.ecs-cluster-runner-role-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | AWS IAM role policy |
| [aws_internet_gateway.aws-igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | VPC internet gateway |
| [aws_route_table.aws-route-table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | VPC route table |
| [aws_security_group.aws-lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | Security group |
| [aws_subnet.aws-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | VPC subnet |
| [aws_vpc.aws-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | VPC |
| [aws_ami.ecs-ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | Data source AMI |