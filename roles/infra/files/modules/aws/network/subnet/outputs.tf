output "subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "key_pair" {
  value = "${aws_key_pair.key_pair.key_name}"
}
