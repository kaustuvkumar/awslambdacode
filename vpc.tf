resource "aws_vpc" "testvpc" {
    cidr_block = "10.69.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "testvpc"
    }
}

resource "aws_subnet" "main-public-1" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "10.69.1.0/24"
    availibilty_zone = "eu-west-1a"
    tags {
        Name = "main-public-1"
    }
}

resource "aws_subnet" "main-public-2" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "10.69.2.0/24"
    availibilty_zone = "eu-west-1b"
    tags {
        Name = "main-public-2"
    }
}

resource "aws_subnet" "main-private-1" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "10.69.3.0/24"
    availibilty_zone = "eu-west-1a"
    tags {
        Name = "main-private-1"
    }
}

resource "aws_subnet" "main-private-2" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "10.69.4.0/24"
    availibilty_zone = "eu-west-1b"
    tags {
        Name = "main-private-2"
    }
}

resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = "${aws_vpc.testvpc.id}"
    tags {
        Name = "internet-gateway"
    }
}

resource "aws_route_table" "main-public" {
    vpc_id = "${aws_vpc.testvpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.internet-gateway.id}"
    }
    tags {
        Name = "main-public-1"
    }
}

resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = "${aws_subnet.main-public-1.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}
resource "aws_route_table_association" "main-public-2-a" {
    subnet_id = "${aws_subnet.main-public-2.id}"
    route_table_id = "${aws_route_table.main-public.id}"
}



