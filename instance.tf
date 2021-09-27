resource "aws_instance" "testinstance" {
    ami = "${lookup(vars.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.main-private-1.id}"
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
}
output "ip" {
    value = "${aws_instance.testinstance.private_ip}"
}