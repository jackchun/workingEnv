# workingEnv

## We need a Kubernetes cluster

Lets create a Kubernetes cluster to play with using [kind](https://kind.sigs.k8s.io/docs/user/quick-start/)

```
kind create cluster --name certmanager --image kindest/node:v1.19.1
```


## Installation 

```

# Get a container to work in

# mount our kubeconfig file and source code
docker run -it --rm -v ${HOME}/.kube:/root/.kube -v ${HOME}/Document/Github:/work -w /work --net host alpine sh

# install kubectl
apk add --no-cache curl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

#test cluster access:
/work # kubectl get nodes
NAME                    STATUS   ROLES    AGE   VERSION
certmanager-control-plane   Ready    master   3m6s   v1.19.1

alias k=kubectl

cd /tmp
wget https://get.helm.sh/helm-v3.7.1-linux-arm64.tar.gz
tar -zxf helm-v3.7.1-linux-arm64.tar.gz
mv linux-arm64/helm /usr/local/bin/helm

# install git
apk add --no-cache git


# clone (not required when mounting Github)
git clone https://github.com/PacktPublishing/Kubernetes-and-Docker-The-Complete-Guide.git
git clone https://github.com/istioinaction/book-source-code.git



# istio
cd 
curl -L https://istio.io/downloadIstio | sh -

cd istio-1.11.4
chmod +x ./bin/istioctl
mv ./bin/istioctl /usr/local/bin/istioctl

istioctl install --set profile=demo -y

```



## test ansible

```
docker run --rm -v ~/Documents/test-playbook:/data  cytopia/ansible ansible-playbook playbook.yml
```
