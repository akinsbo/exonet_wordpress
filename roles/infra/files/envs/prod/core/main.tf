module "vpc" {
  source = "../../../modules/aws/network/vpc"

  vpc_region     = "${var.vpc_region}"
  vpc_name       = "${var.vpc_name}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
}

module "subnet_public" {
  source = "../../../modules/aws/network/subnet"

  vpc_id      = "${module.vpc.id}"
  subnet_name = "${var.subnet1_name}"
  subnet_az   = "${var.subnet1_az}"
  subnet_cidr = "${var.subnet1_cidr}"

}

resource "aws_instance" "ec2_instance" {
  ami             = "ami-02df9ea15c1778c9c"
  instance_type   = "t2.micro"
  subnet_id       = "${module.subnet_public.subnet_id}"
  key_name        = "${module.subnet_public.key_pair_name}"
  security_groups = "${module.security_groups.id}"

  tags = "${merge(map(
    "Resource", "instance"
  ), var.default_tags)}"
}

resource "aws_eip" "ip_for_env" {
  instance = "${aws_instance.ec2_instance.id}"
  vpc      = true
}



###############################################################################
# Traffic Control
###############################################################################

module "security_groups" {
  source = "../../../modules/aws/network/sg"

  vpc_id              = "${module.vpc.id}"
  sg_name             = "${var.sg_name}"
  subnet_public_cidr  = "${var.subnet1_sg_public_cidr}"
  subnet_private_cidr = "${var.subnet1_sg_private_cidr}"
}
