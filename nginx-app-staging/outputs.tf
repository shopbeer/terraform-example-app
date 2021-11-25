output "stg_app_public_dns" {
  value = "${module.my_module.dns_alb}"
}
