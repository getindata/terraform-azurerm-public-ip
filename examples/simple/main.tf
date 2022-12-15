module "terraform_module_template" {
  source = "../../"

  location            = var.location
  resource_group_name = var.resource_group_name
}
