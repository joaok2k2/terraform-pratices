# Resource: aws_iam_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo-terraform"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Resource: aws_iam_role_policy_attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
# ESSA Role-> FUNÇÃO "eks-cluster-demo" ESTÁ ASSUMINDO PLOLICY -> POLITICA  --> AmazonEKSClusterPolicy
resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

# Recurso: Criação do AWS EKS --> aws_eks_cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster
resource "aws_eks_cluster" "demo" {
  name     = var.cluster-name      # NOME DO CLUSTER 
  role_arn = aws_iam_role.demo.arn # Está assumindo função role 

  vpc_config { # Fazer parte das seguintes VPC 
    subnet_ids = [
      aws_subnet.private-sub-1a.id,
      aws_subnet.private-sub-1b.id,
      aws_subnet.public-sub-1a.id,
      aws_subnet.public-sub-1b.id
    ]
  }

  # Certifique-se de que as permissões da função IAM sejam criadas antes e excluídas após o manuseio do cluster EKS.
  # Caso contrário, o EKS não poderá excluir corretamente a infraestrutura do EC2 gerenciada pelo EKS, como grupos de segurança.
  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy] # INTERPOLAÇÃO 
}


# ## INFORMAÇÃO REFERENTE A AmazonEKSClusterPolicy ## #
#{
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "autoscaling:DescribeAutoScalingGroups",
#                 "autoscaling:UpdateAutoScalingGroup",
#                 "ec2:AttachVolume",
#                 "ec2:AuthorizeSecurityGroupIngress",
#                 "ec2:CreateRoute",
#                 "ec2:CreateSecurityGroup",
#                 "ec2:CreateTags",
#                 "ec2:CreateVolume",
#                 "ec2:DeleteRoute",
#                 "ec2:DeleteSecurityGroup",
#                 "ec2:DeleteVolume",
#                 "ec2:DescribeInstances",
#                 "ec2:DescribeRouteTables",
#                 "ec2:DescribeSecurityGroups",
#                 "ec2:DescribeSubnets",
#                 "ec2:DescribeVolumes",
#                 "ec2:DescribeVolumesModifications",
#                 "ec2:DescribeVpcs",
#                 "ec2:DescribeDhcpOptions",
#                 "ec2:DescribeNetworkInterfaces",
#                 "ec2:DetachVolume",
#                 "ec2:ModifyInstanceAttribute",
#                 "ec2:ModifyVolume",
#                 "ec2:RevokeSecurityGroupIngress",
#                 "ec2:DescribeAccountAttributes",
#                 "ec2:DescribeAddresses",
#                 "ec2:DescribeInternetGateways",
#                 "elasticloadbalancing:AddTags",
#                 "elasticloadbalancing:ApplySecurityGroupsToLoadBalancer",
#                 "elasticloadbalancing:AttachLoadBalancerToSubnets",
#                 "elasticloadbalancing:ConfigureHealthCheck",
#                 "elasticloadbalancing:CreateListener",
#                 "elasticloadbalancing:CreateLoadBalancer",
#                 "elasticloadbalancing:CreateLoadBalancerListeners",
#                 "elasticloadbalancing:CreateLoadBalancerPolicy",
#                 "elasticloadbalancing:CreateTargetGroup",
#                 "elasticloadbalancing:DeleteListener",
#                 "elasticloadbalancing:DeleteLoadBalancer",
#                 "elasticloadbalancing:DeleteLoadBalancerListeners",
#                 "elasticloadbalancing:DeleteTargetGroup",
#                 "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
#                 "elasticloadbalancing:DeregisterTargets",
#                 "elasticloadbalancing:DescribeListeners",
#                 "elasticloadbalancing:DescribeLoadBalancerAttributes",
#                 "elasticloadbalancing:DescribeLoadBalancerPolicies",
#                 "elasticloadbalancing:DescribeLoadBalancers",
#                 "elasticloadbalancing:DescribeTargetGroupAttributes",
#                 "elasticloadbalancing:DescribeTargetGroups",
#                 "elasticloadbalancing:DescribeTargetHealth",
#                 "elasticloadbalancing:DetachLoadBalancerFromSubnets",
#                 "elasticloadbalancing:ModifyListener",
#                 "elasticloadbalancing:ModifyLoadBalancerAttributes",
#                 "elasticloadbalancing:ModifyTargetGroup",
#                 "elasticloadbalancing:ModifyTargetGroupAttributes",
#                 "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
#                 "elasticloadbalancing:RegisterTargets",
#                 "elasticloadbalancing:SetLoadBalancerPoliciesForBackendServer",
#                 "elasticloadbalancing:SetLoadBalancerPoliciesOfListener",
#                 "kms:DescribeKey"
#             ],
#             "Resource": "*"
#         },
#         {
#             "Effect": "Allow",
#             "Action": "iam:CreateServiceLinkedRole",
#             "Resource": "*",
#             "Condition": {
#                 "StringEquals": {
#                     "iam:AWSServiceName": "elasticloadbalancing.amazonaws.com"
#                 }
#             }
#         }
#     ]
# }