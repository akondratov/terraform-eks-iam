### Reqirements:
- AWS Account with access and secret keys of admin user
- Terraform cli tool version ~> v0.15.3 https://www.terraform.io/downloads.html
- (optional) Create keypair for EC2 instances (for debug EC2)
- (optional) Created S3 bucket with versioning for remote storing tfstate
- (optional) DynaboDB database for lock tfstate in multi-user development

### How to use:
- update terrafrom.tfvars
  - `vpc_id` - ID of VPC where is EKS cluster will be created
  - `cluster_version` - eks platform version (don't use patch, only minor - https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)
  - `cluster_name` - EKS cluster name
  - `subnets` - subnets in your VPC for deploy cluster
  - `worker_groups` - parameters of workers in Kubernetes cluster
- `terraform init`
  - enter bucket_name, file_name, aws_region
- `terraform plan`
  - check create resources
- `terraform apply`
  - apply configuration

### Optional features:
* Add AWS Load Balancer Controller to eks on init https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html#lbc-install-controller
  * Also need to create IAM OIDC for cluster `eksctl utils associate-iam-oidc-provider --cluster=eks-cluster --approve`
* Add metrics server `kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml` (https://docs.aws.amazon.com/eks/latest/userguide/metrics-server.html)

## TODO
- good vars description with examples
