module "sdm_gateway" {
  source = "./sdm_gateway"

  sdm_node_name      = local.name
  vpc_id             = local.vpc_id
  gateway_subnet_ids = local.public_subnet_ids
  region             = local.region

  tags = local.tags
}