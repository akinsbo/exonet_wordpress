output "public_ip" {
  value = "${aws_eip.ip_for_env.public_ip}"
}