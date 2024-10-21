# Using OIDC to Authenticate from GitHub Actions to Azure for Terraform deployments
## Overview
OIDC allows your GitHub Actions workflows to access resources in Azure, without needing to store the Azure credentials as long-lived GitHub secrets.

You need to configure a federated identity credential on a service principal or a managed identity:
- **User Assigned Managed Identity**: does not require elevated permissions in Azure Active Directory and has a longer token timeout.
- **Service Principals (App Registrations)**: requires permission to create Applications in Azure Active Directory.

> [!NOTE]
> By default, Azure access tokens issued during OIDC based login could have limited validity. Azure access token issued by Service Principal is expected to have an expiration of 1 hour by default. And with Managed Identities, it would be 24 hours. This expiration time is further configurable in Azure.

## Prerequisites
Before you use this example, you need:
- GitHub repository that supports `environments` (e.g a public repo in an Organization, free)
- Resource group where the User-assigned Managed Identity will be deployed
- CLI version is 2.30 or above to support login with OIDC
- Already logged on to GitHub via `gh cli`

## Demo
###  Clone the repo and setup your variables
1. Clone this repository to your local machine.
2. Open the repo in Visual Studio Code. (Hint: In a terminal you can open Visual Studio Code by navigating to the folder and running code .).
3. Navigate to the `demo` folder and create a new file called `terraform.tfvars`.
4. In the `terraform.tfvars` file add the following:
```hcl
 environment = "<value>"
 managed_identity = {
   name                = "<value>"
   resource_group_name = "<value>"
 }
 github_config = {
   owner = "<value>"
   repository  = "<value>"
 }
```

> [!IMPORTANT]
> The module will not create or managed any permissions for the User-assigned Managed Identity. You **must** grant sufficient permissions for your use case. For the purposes of demo, we will grant `Contributor` with scope: deployment RG.

### Apply the Terraform configuration
1. Open the Visual Studio Code Terminal and navigate the `demo` folder.
2. Run `az login` and follow the prompts to login to Azure with your Global Administrator account.
3. Run `az account show`. If you are not connected to you test subscription, change it by running `az account set --subscription "<subscription-id>"`
4. Run `terraform init`.
5. Run `terraform apply`.
6. The plan will complete. Review the plan and see what is going to be created.
7. Type `yes` and hit enter once you have reviewed the plan.
8. Wait for the apply to complete.

> [!NOTE]
> We have also included a `azure-oidc-login.yaml` that you can use for a simple validation.

## References
- [GitHub OIDC Docs](https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-cloud-providers)
