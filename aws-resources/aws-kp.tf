<<<<<<< HEAD
//creating aws kew pair for instance
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
=======
//creating aws kew pair for instance
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
>>>>>>> d22e0d0342898899eef0fecde78332a51fac6aeb
}