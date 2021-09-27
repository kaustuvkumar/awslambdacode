resource "aws_autoscaling_policy" "test-policy" {
    name = "test-policy"
    autoscaling_group_name = "${aws_autoscaling_group.test-autoscaling.name}"
    adjustment_type = "ChangeInCapacity"
    scaling_adjustment = "1"
    cooldown = "300"
    policy_type = "SimpleScaling"
}   