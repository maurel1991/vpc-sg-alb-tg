# Security group alb

resource "aws_security_group" "alb" {
  name = "alb-code"
  vpc_id = aws_vpc.v1.id
  description = "80 and 443"
  ingress {
     description = "allow 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
     description = "allow 443"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
# Security group ws

resource "aws_security_group" "ws" {
  vpc_id = aws_vpc.v1.id
  name = "webser-alb"
  description = "allow 80"
  ingress {
     description = "allow 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    #cidr_blocks = [ "0.0.0.0/0" ]
    security_groups = [aws_security_group.alb.id]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}


