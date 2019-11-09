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
}
