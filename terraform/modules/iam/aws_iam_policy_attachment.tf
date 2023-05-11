resource "aws_iam_policy_attachment" "ecs-attach" {
  name       = "${var.app_name}-iam-attach"
  roles      = ["${aws_iam_role.ecs-role.name}"]
  policy_arn = aws_iam_policy.main-policy.arn
}
