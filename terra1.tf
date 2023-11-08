provider "aws" {
}

#security group
resource "aws_security_group" "web_access111" {
  name        = "web_access111"
  description = "allow ssh and http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
#security group end here

resource "aws_key_pair" "server-demo111" {
  key_name   = "server-demo111"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCluNk5uOIaMBvj5ZbxPPw4SWa2IQWn7nI/azhTHFUkLN7QTODUTaQOqix4ixIAFFCi99+N+gMpvEnV1Vv22NrOIl3n85ddilIsG+aq4AGpzP7fXINI7/otW9KxFFB31dYneP8lqY0S9j7xqBfsGPjHOX6EVWO+tAqVR0+62YIyqDNa3G15thZeI0Zou+HnSPhm18Ytz40JyrqcwyBWz8vGVVaTGqNUu6hrV/kgH48aqPCOuYAu0qSNF2N0PQa1sal7yOKFMXEz0wwGHRhrVCnaJ8q+qJkkd4JDP0BSySG1SgtAE1RdNm0w8dqc7mwYYPS/3rsYMRMbgiQZNQKieZVBcfh78YFrtLdXKw7hre8KfPE/bHjPO6yyOCb73GyywD0gHAf2xMYkICeZ8d0iIZE4KSWMwh8LyEO13L5EavNJqcdPA/FT8ThngYhGz16l2NzV7ZqBMEgRjIGzd04W4PLs4FRsh6RapXYRv2iw1kijW4mnjjy+SLKVIahQiPjobqc= root@terraform"
}

resource "aws_instance" "hello-world" {
  ami               = "ami-05c13eab67c5d8861"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  security_groups   = ["${aws_security_group.web_access111.name}"]
  key_name          = aws_key_pair.server-demo111.key_name
  tags = {
    Name     = "hello-World"
    Stage    = "testing"
    Location = "INDIA"
  }

}


