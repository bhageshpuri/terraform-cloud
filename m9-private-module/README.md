# Using the Private Module Registry

While migrating Team Space Coyote, you found some useful modules you'd like to make available to other groups. You're going to create a private module registry, add the modules, and update a Team Space Coyote's deployment to use the new module location.

## Demos

- Add public modules and providers to the registry
- Create a module with the private registry
- Update the Space Coyote configuration


### Add public modules and providers to the registry

Click on the "Registry" tab at the top of the page. From the providers tab, click on "Search public registry" button. Search for the google provider and add it to the registry.

Click on the modules tab, and click on "Search public registry". Search for the `cloud-storage` module. Add the module to the private registry.


### Add private vpc module to the registry

The Space Coyote configuration utilizes a local `vpc` module for building out the application's vpc components including vpc, subnets, route tables, gateways, etc.  This code is not only relevant for the Space Coyote team, but is common vpc configuration that will prove valuable for other teams as well.  Therefore the Space Coyote team has offered to publish this as a private module to the registry for other teams to be able to use.

Create a new private github repository named `terraform-gcp-vpc`:

- Private
- Add a README.md file
- Add a .gitignore template for Terraform

Add the `network.tf`, `variables.tf` of the local vpc module to this repository.  Create a `README.md` for the repository that contains the contents of the NetworkREADME.md file in the m9 directory.

git clone https://github.com/bhageshpuri/terraform-gcp-vpc.git

cp ./terraform-cloud/m9/modules/vpc/* ./terraform-cloud/terraform-gcp-vpc/ -Recurse

cd .\terraform-gcp-vpc\

git add *
git commit -m "FIrst commit"
git push

Copy the content of NetworkREADME.md

After adding the files to the repository, create a new version for the module by creating a Tag with the value `1.0.0`.

Click - code - tags - releases - create new release

Choose a tag - type v1.0.0 - create new tag 

Release title - Version 1.0 - publish release

In the Terraform Cloud UI, you will need to create an OAuth based VCS connection to GitHub, if you haven't already done so. The GitHub App connection will not work with the private registry.

In the organization settings, go to the **Providers** area of Version control and Add a VCS provider. Select *GitHub.com (Custom)* from the list of providers and walk through the steps to create the connection via OAuth.

Copy the client ID

Back to Provider page 
Name - GitHub.com OAuth
Paste the client ID

Back to OAuth page - Client secrets - Generate a new client secret - enter password - copy the secret as it will not be show again

paste the secret - connect and continue - Authorize - skip and finish


Click on the "Registry" tab at the top of the page. "Publish" button followed by "Module". Click on the "GitHub" button and select the `terraform-gcp-vpc` repository that you just created.

Click on the "Publish module" button.

### Update the Space Coyote configuration

Update the Space Coyote configuration `main.tf` file to remove the local `vpc` module and start using the new `vpc` module in the Terraform Cloud private module registry.

```hcl
module "vpc" {
  source       = "./modules/vpc"
  network_name = var.network_name
  subnet_name = var.subnet_name
}
```

You can copy the module creation code from the "Usage Instructions" section of the module's page in your Private Module Registry.

```hcl
module "vpc" {
  source  = "app.terraform.io/luvveroenterprises/vpc/gcp"
  version = "1.0.0"
  network_name = var.network_name
  subnet_name = var.subnet_name
}
```
Remove the local vpc directory

You can then validate and apply the change by using the new centralized module from Terraform Cloud and remove the local module.

```bash
terraform init
terraform validate
terraform apply
```
