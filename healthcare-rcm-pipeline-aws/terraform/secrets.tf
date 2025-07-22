resource "aws_secretsmanager_secret" "sftp_password" {
  name = "sftp-password"
}