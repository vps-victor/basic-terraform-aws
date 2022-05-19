resource "aws_security_group_rule" "ssh-access" {
  type                = "ingress"
  from_port           = 22
  to_port             = 22
  protocol            = "tcp"
  cidr_blocks         = "${var.cdirs_acesso_remoto}"
  # ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id   = "sg-xxxxxxxxxxxxxxxxx"
}

resource "aws_security_group_rule" "ssh-access-us-east-2" {
  provider 		    = aws.us-east-2
  type                = "ingress"
  from_port           = 22
  to_port             = 22
  protocol            = "tcp"
  cidr_blocks         = "${var.cdirs_acesso_remoto}"
  # ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
  security_group_id   = "sg-xxxxxxxxxxxxxxxxx"
}