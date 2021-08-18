### Requirements: 
- kubectl v1.22.0+ (https://kubernetes.io/docs/tasks/tools/)
- kubeconfig file (see ./eks/ folder)
- eksctl 0.51.0 (https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)

### For create iam role (run once)
1. Create policy for access to S3 Bucket https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html
2. Create IAM role and service account for pod
`eksctl create iamserviceaccount --name iam-test --namespace default --cluster eks-cluster --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --approve --override-existing-serviceaccounts` (change variables if needed)

### For check policy attachment:
1. Apply the test job: `kubectl --kubeconfig <path_to_kubeconfig> apply -f test-job.yml` 
2. Check logs and see result: `kubectl --kubeconfig <path_to_kubeconfig> logs eks-iam-test...` 
3. Delete job: `kubectl --kubeconfig <path_to_kubeconfig> delete job eks-iam-test...`

### Deploy pod with your own policy:
1. Update file `pod-iam.yaml` for change imagename and entrypoint (https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
2. Apply pod template: `kubectl --kubeconfig <path_to_kubeconfig> apply -f test-job.yml`