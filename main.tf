locals {
  region  = "ap-southeast-2"
  numList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  result  = sum([for x in local.numList : 10 * x if x % 2 == 0])

  resource_tags = {
    project     = "PaaS",
    environment = "prod"
  }

  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }

  tags = merge(local.required_tags, local.resource_tags)
}

# create random string
resource "random_string" "main" {
  length           = 20
  lower            = true
  upper            = true
  numeric          = true
  special          = true
  override_special = "/@£$"
}

# add random pet name
resource "random_pet" "main" {
  length = 4
}

# create local file with random contents
resource "local_file" "main" {
  filename = "${path.module}/foo.txt"
  content  = random_string.main.result
}
