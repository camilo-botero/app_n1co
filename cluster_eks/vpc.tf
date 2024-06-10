resource "aws_vpc" "main_vpc" {
    cidr_block = local.cidr_vpc
    enable_dns_hostnames = true
    enable_dns_support =  true

    tags = {
        Name = "${local.project}-vpc"
        project = local.project
    }
}
