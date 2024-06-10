resource "aws_security_group" "sg_rds" {
  name        = "sg_rds"
  description = "Grupo de seguridad RDS"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_eks.id]  # Allowing traffic from the EKS security group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project}-sg-rds"
    project = local.project
  }
}