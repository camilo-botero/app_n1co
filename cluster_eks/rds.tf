resource "aws_db_instance" "mariadb" {
  allocated_storage    = 20
  engine               = "mariadb"
  engine_version       = "10.5"
  instance_class       = "db.t3.micro"
  db_name              = local.db_name
  username             = "root"
  password             = local.db_root_password
  parameter_group_name = "default.mariadb10.5"
  skip_final_snapshot  = true
  multi_az             = true

  vpc_security_group_ids = [aws_security_group.sg_rds.id]
  db_subnet_group_name   = aws_db_subnet_group.subnet_group_rds.name

  tags = {
      Name = "${local.project}-mariadb-instance"
      project = local.project
}
}