# =============================================================================
# CONFIGURATION
# =============================================================================
# This file defines the variables needed to install a gateway into your existing  # AWS VPC and Subnets.
#
# =============================================================================

locals {
  name = "new-gateways"

  vpc_id = "vpc-123456789abcdef0"

  region = "us-west-2"

  # The number of gateways created is determined by the number of subnet IDs
  # provided in the variable "gateway_subnet_ids". To create multiple gateways,
  # simply add more subnet IDs to the list.
  public_subnet_ids = ["subnet-1234567890", "subnet-abcdef1234"]

  private_subnet_ids = ["subnet-1234567890", "subnet-1234567890"]

  tags = merge(
    # Enter Tags here:
    { project = "new-gateways" },
    {
      CreatedBy = "SDM-Admin" # Identifies resources created by this module
      Terraform = "true"                # Marks resources as Terraform-managed
    }
  )
}