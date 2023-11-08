provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVESTDYNWKQDIZG6C"
  secret_key = "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"
}

#security group
resource "aws_security_group" "web_access11" {
        name = "web_access11"
        description = "allow ssh and http"

        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }


}
#security group end here

resource "aws_key_pair" "server-demo11" {
  key_name   = "server-demo11"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDogcWDdtPTryrIXNiJ/DZiNMPwE+TJc0a7M50n5zZSYrMTzlfrSWIkO8XxWfujJGY0UMIBXieTqohK0rjCBubJpIj+ZuGLRBUpPX3ECzBCfC/3CyYp+KxKIvVXMHMYOWLaQPvaG4JIpDRITF4WcKmdBDZgEZdBAk/uNH2SL9FeIeg+NCeKyZFO+X2nzHNsw3SbpBSxL0Chj3xXX7OVW+UW7QFBaEdvVQ3BUiFWk67BByNyqTw8PZ/H8uo8PAyZmOGD3A8Rylkb9raa5oMYqaeqHdfd1LQJh2mngJUwXklgholWPOnRVg22PjNwlS/S04J89kL/sV0u55fh9tP0mJRB7CgayxF335KeJ+AMQjJBWCUfS38ORV4YKXrKK2IyeenWMRq2HSU6XzSsjkZ6NHOJJ9UOZM+jpE1xGsf3SSu9X0YlUab8Rke+jxHougs7J6HC/srOZAXAF6oBcDJwE1QGALwhTcvbxoeZvQSU4b9d+DDCeIX7bKNt8BwMNVoIDcM= root@terraform"
}

resource "aws_instance" "hello-world" {
  ami           = "ami-05c13eab67c5d8861"
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web_access11.name}"]
  key_name = aws_key_pair.server-demo11.key_name
  tags = {
    Name  = "hello-World"
    Stage = "testing"
    Location = "INDIA"
  }

}


