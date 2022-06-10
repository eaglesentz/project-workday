resource "aws_secretsmanager_secret" "workdaysecret" {
  name = var.secretname
}

# Creating a AWS secret versions for database master account (Masteraccoundb)

resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.workdaysecret.id
  secret_string = <<EOF
   { "username": "${var.username}",
     "password": "${var.password}"
   }
EOF
}