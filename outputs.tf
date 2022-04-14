output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnets" {
  value = { for k, v in aws_subnet.subnets : k => {
    "id"                   = v.id,
    "arn"                  = v.arn,
    "cidr_block"           = v.cidr_block,
    "availability_zone"    = v.availability_zone,
    "availability_zone_id" = v.availability_zone_id,
    "vpc_id"               = v.vpc_id
  } }
}

output "internet_gateways" {
  value = { for k, v in aws_internet_gateway.internet : k => {
    "id"     = v.id,
    "arn"    = v.arn,
    "vpc_id" = v.vpc_id
  } }
}

output "nat_gateways" {
  value = { for k, v in aws_nat_gateway.nat_gateways : k => {
    "id"                   = v.id,
    "allocation_id"        = v.allocation_id,
    "network_interface_id" = v.network_interface_id,
    "private_ip"           = v.private_ip,
    "public_ip"            = v.public_ip,
    "subnet_id"            = v.subnet_id
  } }
}

output "route_tables" {
  value = { for k, v in aws_route_table.route_tables : k => {
    "id"    = v.id,
    "arn"   = v.arn,
    "route" = v.route
  } }
}

output "route_table_associations" {
  value = { for k, v in aws_route_table_association.route_table_association : k => {
    "id"             = v.id,
    "route_table_id" = v.route_table_id,
    "subnet_id"      = v.subnet_id
  } }
}

output "network_acls" {
  value = { for k, v in aws_network_acl.nacls : k => {
    "id"      = v.id,
    "arn"     = v.arn,
    "vpc_id"  = v.vpc_id,
    "egress"  = v.egress,
    "ingress" = v.ingress,
    "vpc_id"  = v.vpc_id
  } }
}

output "network_acl_associations" {
  value = { for k, v in aws_network_acl_association.nacl_association : k => {
    "id"             = v.id,
    "network_acl_id" = v.network_acl_id,
    "subnet_id"      = v.subnet_id
  } }
}
