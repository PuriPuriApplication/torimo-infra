# helm
## Requirements
- helm

    `curl -O https://get.helm.sh/helm-v2.16.0-darwin-amd64.tar.gz`
    
    `tar zxvf helm-v2.16.0-darwin-amd64`
    
    `sudo mv darwin-amd64/helm /usr/local/bin/`
- kubectl

    `curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/darwin/amd64/kubectl`
    
    `chmod 755 kubectl`
    
    `sudo mv kubectl /usr/local/bin/`
- eksctl

    `curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp`

    `sudo mv /tmp/eksctl /usr/local/bin`

## Usage
- Create EKS cluster

    `helm template helm/ --set cluster.enabled=true | eksctl create cluster -f -`
- Deploy ingress controller
    
    `helm template helm/ --set controller.enabled=true | kubectl apply -f -`
- Deploy ALB

    `helm template helm/ --set ingress.enabled=true | kubectl apply -f -`