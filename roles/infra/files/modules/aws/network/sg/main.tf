resource "aws_security_group" "security_group" {
  name   = "${var.sg_name}"
  vpc_id = "${var.vpc_id}"

  # allow MySQL connection
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = "${var.subnet_private_cidr}"
  }

  # allow SSH
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = "${var.subnet_public_cidr}"
  }

  ingress {  #HTTP Port
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = "${var.subnet_public_cidr}"

  }
  ingress {  #SSH Port
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = "${var.subnet_public_cidr}"
  }

  egress {
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks = "${var.subnet_egress_cidr_block}"
}

}

resource "aws_security_group" "ping-ICMP" {
  name        = "default-ping-example"
  description = "Default security group that allows to ping the instance"
  #vpc_id      = "${aws_vpc.my-vpc.id}"

  ingress {
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = "${var.subnet_public_cidr}"
    ipv6_cidr_blocks = ["::/0"]
  }

}