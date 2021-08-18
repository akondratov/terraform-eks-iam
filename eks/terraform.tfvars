vpc_id             = "vpc-1234567890"
cluster_version    = "1.19"
cluster_name       = "eks-cluster"
subnets            = ["subnet-1234567890", "subnet-1234567890"]

worker_groups = [
  # ondemand linux
  {
    name                = "on-demand-1"
    instance_type       = "t3.micro"
    asg_max_size        = 2
    asg_min_size        = 2
    kubelet_extra_args  = "--node-labels=spot=false"
    suspended_processes = ["AZRebalance"]
    root_volume_size    = "20"
    root_volume_type    = "gp2"
    # key_name            = "eks-cluster"
    tags                = [
      {
        "key"                 = "terraform",
        "value"               = "true",
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "cluster-name",
        "value"               = "eks-cluster",
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "spot",
        "value"               = "false",
        "propagate_at_launch" = "true"
      },
      {
        "key"                 = "os",
        "value"               = "linux",
        "propagate_at_launch" = "true"
      },
    ]
  },
]
# launch groups for spot instances
# worker_groups_launch_template = [
#   {
#     name                    = "spot-1"
#     override_instance_types = ["t3a.micro", "t3.micro"]
#     spot_instance_pools     = 2
#     asg_max_size            = 2
#     asg_min_size            = 2
#     asg_desired_capacity    = 2
#     kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
#     public_ip               = true
#     root_volume_size        = "20"
#     root_volume_type        = "gp2"
#     key_name                = "eks-cluster"
#     tags                = [
#       {
#         "key"                 = "terraform",
#         "value"               = "true",
#         "propagate_at_launch" = "true"
#       },
#       {
#         "key"                 = "cluster-name",
#         "value"               = "eks-cluster",
#         "propagate_at_launch" = "true"
#       },,
#       {
#         "key"                 = "spot",
#         "value"               = "true",
#         "propagate_at_launch" = "true"
#       },
#       {
#         "key"                 = "os",
#         "value"               = "linux",
#         "propagate_at_launch" = "true"
#       },
#     ]
#   },
# ]
