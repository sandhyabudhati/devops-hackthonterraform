# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

# ECR Repository Names
variable "ecr_repo_patient" {
  description = "The name of the Patient Service ECR repository"
  type        = string
  default     = "patient-service"
}

variable "ecr_repo_appointment" {
  description = "The name of the Appointment Service ECR repository"
  type        = string
  default     = "appointment-service"
}

# Docker Image Tags
variable "patient_service_tag" {
  description = "Tag for the Patient service Docker image"
  type        = string
  default     = "prodpatient"
}

variable "appointment_service_tag" {
  description = "Tag for the Appointment service Docker image"
  type        = string
  default     = "prodappointment"
}

# VPC Subnets
variable "subnets" {
  description = "List of subnet IDs for ECS services"
  type        = list(string)
}

# Security Groups
variable "security_groups" {
  description = "List of security group IDs for ECS services"
  type        = list(string)
}

# ECS Cluster Name
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "devops_sandhya_tf_cluster"
}

# IAM Role for ECS Task Execution
variable "ecs_task_execution_role_arn" {
  description = "The ARN of the IAM role used by ECS tasks"
  type        = string
}

# Container Port Mappings
variable "container_port" {
  description = "The container port to expose"
  type        = number
  default     = 80
}

# CPU and Memory for ECS Task Definition
variable "ecs_task_cpu" {
  description = "The CPU to allocate for the ECS task"
  type        = string
  default     = "256"
}

variable "ecs_task_memory" {
  description = "The memory to allocate for the ECS task"
  type        = string
  default     = "512"
}
