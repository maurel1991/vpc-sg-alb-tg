resource "aws_instance" "server1" {
  availability_zone = "us-east-1a"
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.ws.id]
  ami = "ami-0166fe664262f664c"
  instance_type = "t2.micro"
  user_data = file("code.sh")
  subnet_id = aws_subnet.priv1.id
  tags = {
    Name = "Webserver-1"
  }
}
resource "aws_instance" "server2" {
  availability_zone = "us-east-1b"
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.ws.id]
  ami = "ami-0166fe664262f664c"
  instance_type = "t2.micro"
  user_data = file("code.sh")
  subnet_id = aws_subnet.priv2.id
  tags = {
    Name = "Webserver-2"
  } 
}