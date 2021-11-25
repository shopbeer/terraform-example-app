terraform {
  backend "s3" {
    bucket = "cgadmin-tf-state-sing"
    key    = "nginx-app/staging.tfstate"
    region = "ap-southeast-1"
  }
}

module "my_module" {
  source = "../modules/"

  app_name = "my_nginx_app"
  app_environment = "staging"
  aws_region = "ap-southeast-1"
  app_sources_cidr = ["0.0.0.0/0"]
  admin_sources_cidr = ["0.0.0.0/0"]
  aws_key_pair_name = "cgadmin-singapore-key"
  nginx_app_image = "nginx:alpine"
}
