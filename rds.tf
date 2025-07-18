resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds-subnet-group"
subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]  # ✅ Use 2 private subnets
}

resource "aws_db_instance" "web_db" {
  identifier           = "my-rds-db"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "yourpassword"
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true
}
