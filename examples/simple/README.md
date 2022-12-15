# Simple Example

```terraform
module "terraform_module_template" {
  source = "../../"

  location            = var.location
  resource_group_name = var.resource_group_name
}
```

## Usage

```
terraform init
terraform plan -var-file fixtures.west-europe.tfvars -out tf.plan
terraform apply tf.plan
```
