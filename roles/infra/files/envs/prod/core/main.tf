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

module "key" {
  source = "../../../modules/aws/security/key"

  ssh_public_key_path = "${var.ssh_public_key_path}"
  ssh_key_algorithm = "${var.ssh_key_algorithm}"
  private_key_extension = "${var.private_key_extension}"
  public_key_extension = "${var.private_key_extension}"
  chmod_command = "${var.chmod_command}"
}


resource "aws_instance" "ec2_instance" {
  ami             = "ami-0cc0a36f626a4fdf5"
  instance_type   = "t2.micro"
  subnet_id       = "${module.subnet_public.subnet_id}"
  key_name        = "${module.key.key_pair}"
  security_groups = ["${module.security_groups.security_group_id}"]

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
  subnet_public_cidr  = "${var.subnet1_public_sg_cidr}"
  subnet_private_cidr = "${var.subnet1_private_sg_cidr}"
}
