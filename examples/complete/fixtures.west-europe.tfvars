namespace           = "gid"
stage               = "example"
location            = "West Europe"
resource_group_name = "example"

descriptor_formats = {
  resource-group = {
    labels = ["name"]
    format = "%v-rg"
  }
}

tags = {
  Terraform = "True"
}
