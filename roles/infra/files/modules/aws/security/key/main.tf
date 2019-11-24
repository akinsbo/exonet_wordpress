## SSH key-pair to be used to access instances in public subnet
resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "public_${var.subnet_name}"
  public_key = "${tls_private_key.generated.public_key_openssh}"
}

locals {
  public_key_filename  = "${var.ssh_public_key_path}/${var.public_key_extension}"
  private_key_filename = "${var.ssh_public_key_path}/${var.private_key_extension}"
}


resource "local_file" "public_key_openssh" {
  depends_on = [tls_private_key.generated]
  content    = tls_private_key.default.public_key_openssh
  filename   = local.public_key_filename
}

resource "local_file" "private_key_pem" {
  depends_on = [tls_private_key.default]
  content    = tls_private_key.default.private_key_pem
  filename   = local.private_key_filename
}

resource "null_resource" "chmod" {
  count      = var.chmod_command != "" ? 1 : 0
  depends_on = [local_file.private_key_pem]

  provisioner "local-exec" {
    command = format(var.chmod_command, local.private_key_filename)
  }
}ß