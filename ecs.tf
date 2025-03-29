# ECS Task Definition for Patient Service
resource "aws_ecs_task_definition" "patient_service" {
  family                   = "patient-service-task"
  container_definitions    = jsonencode([{
    name      = "patient-service"
    image     = "${aws_ecr_repository.patient_service.repository_url}:${var.patient_service_tag}"
    cpu       = var.ecs_task_cpu
    memory    = var.ecs_task_memory
    essential = true
  }])
}

# ECS Task Definition for Appointment Service
resource "aws_ecs_task_definition" "appointment_service" {
  family                   = "appointment-service-task"
  container_definitions    = jsonencode([{
    name      = "appointment-service"
    image     = "${aws_ecr_repository.appointment_service.repository_url}:${var.appointment_service_tag}"
    cpu       = var.ecs_task_cpu
    memory    = var.ecs_task_memory
    essential = true
  }])
}
