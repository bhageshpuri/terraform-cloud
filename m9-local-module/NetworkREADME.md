# gcp vpc Terraform module

Terraform module which creates a VPC, Subnets, Internet Gateway and Route Table associations on gcp with all (or almost all) features provided by Terraform gcp provider.

## Usage

### VPC with Subnets

Example:

```hcl
module "vpc" {
  source  = "app.terraform.io/luvveroenterprises/vpc/gcp"
  version = "1.0.0"
  network_name = var.network_name
  subnet_name = var.subnet_name
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >1.0.0 |
| gcp | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| gcp | ~>3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | (Required) The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created. Example: 10.0.0.0/16. | `string` | n/a | yes |
| environment | (Required) Application environment for deployment, defaults to development. | `string` | n/a | yes |
| prefix | (Required) This prefix will be included in the name of most resources. | `string` | n/a | yes |
| region | (Optional) The region where the resources are created. Defaults to us-east-1. | `string` | `"us-east-1"` | no |
| subnet\_prefix | (Required) The address prefix to use for the subnet. Example: 10.0.10.0/24. | `string` | `"10.0.10.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id | Subnet id for application |
| vpc\_id | VPC id for application |