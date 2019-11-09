output "subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "key_pair_name" {
  value = "${aws_key_pair.key_pair}"
}
