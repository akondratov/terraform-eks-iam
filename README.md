# terraform-eks

### Reqirements:
- AWS Account with access and secret keys of admin user
- Terraform cli tool version ~> v0.15.3 https://www.terraform.io/downloads.html
- (optional) Create keypair for EC2 instances (for debug EC2)
- (optional) Created S3 bucket with versioning for remote storing tfstate
- (optional) DynaboDB database for lock tfstate in multi-user development

### How to use:
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

# TODO
- latest k8s version from data
- assume iam role to pod feature
- runing pod istructions
