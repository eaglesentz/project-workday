resource "aws_launch_configuration" "launch_config" {
  name_prefix                 = "workday-config"
  image_id                    = var.ami-id # Ubuntu 18.04 LTS. https://cloud-images.ubuntu.com/locator/ec2/
  instance_type               = var.instance_type
  user_data                   = file("${path.module}/scripts/bootstrap.sh")
  security_groups             = [aws_security_group.alb_security_group.id]
  associate_public_ip_address = true
  key_name                    = var.keypair
  #iam_instance_profile        = aws_iam_instance_profile.bjss_ec2_profile.name

  lifecycle {
    create_before_destroy = true
  }
}