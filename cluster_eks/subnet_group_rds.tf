resource "aws_db_subnet_group" "subnet_group_rds" {
  name       = "${local.project}-rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]

  tags = {
    Name = "${local.project}-rds-subnet-group"
    project = local.project
  }
}