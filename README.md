# Quick Add Two New Gateways To Your Existing VPC

This Terraform module will create two new gateways in your AWS Console and add them to your StrongDM AdminUI.

What will be created in AWS:

- Two t3.medium EC2 Gateway instances
- 1 Security Group for the new Gateways

## Prerequisites

To successfully run the AWS Terraform module, you need the following:

- A StrongDM administrator account. If you do not have one, [sign up](https://www.strongdm.com/signup-contact/) for a trial.
- A [StrongDM API key](https://www.strongdm.com/docs/admin-ui-guide/access/api-keys/), which you can generate in the [StrongDM Admin UI](https://app.strongdm.com/app/access/tokens). Your StrongDM API key needs all permissions granted to it in order to generate the users and resources for these Terraform scripts.
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) v1.0.0 or higher installed on your computer.
- An AWS SSO account or API key with permissions to provision all intended AWS resources including VPC, EKS, RDS, and EC2 resources. To control these settings, go to your [AWS Dashboard](https://console.aws.amazon.com/ec2/v2/home) and click **Key Pairs**.
- Choose an appropriate AWS region for deployment (default: us-west-2).

> **Warning:** These scripts create infrastructure resources in your AWS account, incurring AWS costs. Once you are done testing, remove these resources to prevent unnecessary AWS costs. You can remove resources manually or with `terraform destroy`. StrongDM provides these scripts as is, and does not accept liability for any alterations to AWS assets or any AWS costs incurred.

## Customize the Terraform Module

Modify the `config.tf` file to with your project Name, VPC ID, Subnet IDs, and region.

- You can add resource tags at the bottom of the file.

## Run the Terraform Module

1. Clone the repository:

   ```shell
   git clone https://github.com/berretterry/sdm-simple-aws-gateway.git
   ```

2. Switch to the directory containing the cloned project:

   ```shell
   cd sdm-simple-aws-gateway
   ```

3. Set environment variables for the API key

   ```shell
   # strongdm access and secret keys
   export SDM_API_ACCESS_KEY=auth-xxxxxxxxxxxx
   export SDM_API_SECRET_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

   # For the AWS creds, ideally set your profile.
   export AWS_PROFILE=sdm-admin

   # Otherwise, set your keys
   # export AWS_ACCESS_KEY_ID=xxxxxxxxx
   # export AWS_SECRET_ACCESS_KEY=xxxxxxxxx
   ```

   Note that [direnv](https://direnv.net) is a secure solution to automatically load environment variables from a `.envrc` file as soon as you are in the directory containing the file.

4. Initialize the working directory containing the Terraform configuration files:

   ```shell
   terraform init
   ```

5. Plan your Terraform deployment:

   ```shell
   terraform plan
   ```

6. Execute the actions proposed in the Terraform plan:

   ```shell
   terraform apply
   ```

   The script runs until it is complete. Note any errors. If there are no errors, you should see new resources, such as databases, clusters, or servers, in the StrongDM Admin UI. Additionally, your AWS Management Console displays any new resources added when you ran the module.

7. If necessary, remove the resources created with your Terraform plan:

   ```shell
   terraform destroy
   ```
