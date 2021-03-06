data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "v17.1.0"

  cluster_enabled_log_types = var.cluster_enabled_log_types
  cluster_log_kms_key_id = var.cluster_log_kms_key_id
  cluster_log_retention_in_days = var.cluster_log_retention_in_days
  cluster_name = var.cluster_name
  cluster_security_group_id = var.cluster_security_group_id
  cluster_version = var.cluster_version
  kubeconfig_output_path = var.kubeconfig_output_path
  kubeconfig_file_permission = var.kubeconfig_file_permission
  write_kubeconfig = var.write_kubeconfig
  manage_aws_auth = var.manage_aws_auth
  aws_auth_additional_labels = var.aws_auth_additional_labels
  map_accounts = var.map_accounts
  map_roles = var.map_roles
  map_users = var.map_users
  subnets = var.subnets
  tags = var.tags
  vpc_id = var.vpc_id
  worker_groups = var.worker_groups
  workers_group_defaults = var.workers_group_defaults
  worker_groups_launch_template = var.worker_groups_launch_template
  worker_security_group_id = var.worker_security_group_id
  worker_ami_name_filter = var.worker_ami_name_filter
  worker_ami_name_filter_windows = var.worker_ami_name_filter_windows
  worker_ami_owner_id = var.worker_ami_owner_id
  worker_ami_owner_id_windows = var.worker_ami_owner_id_windows
  worker_additional_security_group_ids = var.worker_additional_security_group_ids
  worker_sg_ingress_from_port = var.worker_sg_ingress_from_port
  workers_additional_policies = var.workers_additional_policies
  kubeconfig_aws_authenticator_command = var.kubeconfig_aws_authenticator_command
  kubeconfig_aws_authenticator_command_args = var.kubeconfig_aws_authenticator_command_args
  kubeconfig_aws_authenticator_additional_args = var.kubeconfig_aws_authenticator_additional_args
  kubeconfig_aws_authenticator_env_variables = var.kubeconfig_aws_authenticator_env_variables
  kubeconfig_name = var.kubeconfig_name
  cluster_create_timeout = var.cluster_create_timeout
  cluster_delete_timeout = var.cluster_delete_timeout
  cluster_create_security_group = var.cluster_create_security_group
  worker_create_security_group = var.worker_create_security_group
  worker_create_initial_lifecycle_hooks = var.worker_create_initial_lifecycle_hooks
  worker_create_cluster_primary_security_group_rules = var.worker_create_cluster_primary_security_group_rules
  permissions_boundary = var.permissions_boundary
  iam_path = var.iam_path
  cluster_create_endpoint_private_access_sg_rule = var.cluster_create_endpoint_private_access_sg_rule
  cluster_endpoint_private_access_cidrs = var.cluster_endpoint_private_access_cidrs
  cluster_endpoint_private_access_sg = var.cluster_endpoint_private_access_sg
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  manage_cluster_iam_resources = var.manage_cluster_iam_resources
  cluster_iam_role_name = var.cluster_iam_role_name
  manage_worker_iam_resources = var.manage_worker_iam_resources
  workers_role_name = var.workers_role_name
  attach_worker_cni_policy = var.attach_worker_cni_policy
  create_eks = var.create_eks
  node_groups_defaults = var.node_groups_defaults
  node_groups = var.node_groups
  enable_irsa = var.enable_irsa
  eks_oidc_root_ca_thumbprint = var.eks_oidc_root_ca_thumbprint
  cluster_encryption_config = var.cluster_encryption_config
  fargate_profiles = var.fargate_profiles
  create_fargate_pod_execution_role = var.create_fargate_pod_execution_role
  fargate_pod_execution_role_name = var.fargate_pod_execution_role_name
  cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr
  cluster_egress_cidrs = var.cluster_egress_cidrs
  workers_egress_cidrs = var.workers_egress_cidrs
  wait_for_cluster_timeout = var.wait_for_cluster_timeout
}