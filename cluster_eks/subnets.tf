resource "aws_subnet" "private_subnet1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = local.cidr_private_subnet1
    availability_zone = local.zone1

    tags = {
        Name = "${local.project}-private-subnet1"
        project = local.project
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/${local.project}-${local.eks_name}"  = "owned"
    }
}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = local.cidr_public_subnet1
    availability_zone = local.zone1
    map_public_ip_on_launch = true

    tags = {
        Name = "${local.project}-public-subnet1"
        project = local.project
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/${local.project}-${local.eks_name}"  = "owned"
    }
}

resource "aws_subnet" "private_subnet2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = local.cidr_private_subnet2
    availability_zone = local.zone2

    tags = {
        Name = "${local.project}-private-subnet2"
        project = local.project
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/${local.project}-${local.eks_name}"  = "owned"
    }
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = local.cidr_public_subnet2
    availability_zone = local.zone2
    map_public_ip_on_launch = true

    tags = {
        Name = "${local.project}-public-subnet2"
        project = local.project
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/${local.project}-${local.eks_name}"  = "owned"
    }
}