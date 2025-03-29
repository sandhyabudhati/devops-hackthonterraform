resource "aws_ecr_repository" "patient-service" {
  name = "patient-service"
}

resource "aws_ecr_repository" "appointment-service" {
  name = "appointment-service"
}
