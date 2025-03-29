# Security Group for Patient Service
resource "aws_security_group" "patient_service_sg" {
  name        = "patient-service-sg-dev"
  description = "Security group for Patient Service in dev environment"
  vpc_id      = aws_vpc.devops_vpc.id  # Replace with your VPC ID
  
  # Ingress and egress rules as per your requirements
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for Appointment Service
resource "aws_security_group" "appointment_service_sg" {
  name        = "appointment-service-sg-dev"
  description = "Security group for Appointment Service in dev environment"
  vpc_id      = aws_vpc.devops_vpc.id  # Replace with your VPC ID
  
  # Ingress and egress rules as per your requirements
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
