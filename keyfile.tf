resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file("#path for sshkey")

    tags = {
      Name = "AWS SSH Key"
    }
  
}
