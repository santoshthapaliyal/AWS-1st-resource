#creating ec2 instance
resource "aws_instance" "web" {
  ami                    = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "firts-tf-instance"
  }
  user_data = file("${path.module}/script.sh")
  connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("${path.module}/id_rsa")
        host = "${self.public_ip}"
    }
  #file,local-exec,remote-exec
  provisioner "file" {
    source = "readme.md"
    destination = "/tmp/readme.md" 
  }
   provisioner "file" {
    content = "this is test content" #terrafrom machine
    destination = "/tmp/content.md"  #remote machine
    }
   
}
