# =============================================================================
# CONFIGURATION
# =============================================================================
# This file defines the variables needed to install a gateway into your existing  # AWS VPC and Subnets.
#
# =============================================================================

locals {
  name = "russ-test-gateway"

  vpc_id = "vpc-0f0ffe2030fbf794b"

  region = "us-west-2"

  # The number of gateways created is determined by the number of subnet IDs
  # provided in the variable "gateway_subnet_ids". To create multiple gateways,
  # simply add more subnet IDs to the list.
  public_subnet_ids = ["subnet-01a8784d0640f2a27", "subnet-053fcc741e412624f"]

  private_subnet_ids = ["subnet-0e34dd2d5952ae666", "subnet-0a2deeb80bb64d447"]

  tags = merge(
    # Enter Tags here:
    { project = "new-gateways" },
    {
      CreatedBy = "SDM-Admin" # Identifies resources created by this module
      Terraform = "true"                # Marks resources as Terraform-managed
    }
  )
}