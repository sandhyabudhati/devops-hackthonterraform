# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

# IAM Role Policy for ECS Task Execution (allowing access to ECR & CloudWatch logs)
resource "aws_iam_policy" "ecs_execution_policy" {
  name        = "ecs-execution-policy"
  description = "Allow ECS tasks to pull images from ECR and log to CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "logs:CreateLogStream"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "logs:PutLogEvents"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Attach policy to ECS execution role
resource "aws_iam_role_policy_attachment" "ecs_execution_policy_attachment" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = aws_iam_policy.ecs_execution_policy.arn
}

# IAM Role for ECS Task (to allow the task to interact with other AWS services)
resource "aws_iam_role" "ecs_task_role" {
  name = "ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

# IAM Role Policy for ECS Task Role (adjust based on what your task needs to interact with)
resource "aws_iam_policy" "ecs_task_policy" {
  name        = "ecs-task-policy"
  description = "Allow ECS tasks to interact with other AWS resources as needed"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "dynamodb:Query"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "s3:ListBucket"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Attach policy to ECS task role
resource "aws_iam_role_policy_attachment" "ecs_task_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.ecs_task_policy.arn
}
