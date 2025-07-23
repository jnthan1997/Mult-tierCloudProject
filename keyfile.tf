resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file("~/.ssh/aws-key.pub")

    tags = {
      Name = "AWS SSH Key"
    }
  
}