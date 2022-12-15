# Simple Example

```terraform
module "resource_group" {
  source  = "github.com/getindata/terraform-azurerm-resource-group?ref=v1.2.0"

  name     = var.resource_group_name
  location = var.location
}

module "public_ip" {
  source  = "../../"

  name = "public-ip"

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  allocation_method = "Dynamic"
}
```

## Usage

```
terraform init
terraform plan -var-file fixtures.west-europe.tfvars -out tf.plan
terraform apply tf.plan
```
