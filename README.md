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
docker run -it --rm -v ${HOME}/.kube:/root/.kube -v ${PWD}:/work -w /work --net host alpine sh

# install kubectl
apk add --no-cache curl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

#test cluster access:
/work # kubectl get nodes
NAME                    STATUS   ROLES    AGE   VERSION
certmanager-control-plane   Ready    master   3m6s   v1.19.1

# install git
apk add --no-cache git
# clone
git clone https://github.com/PacktPublishing/Kubernetes-and-Docker-The-Complete-Guide.git
git clone https://github.com/istioinaction/book-source-code.git

```
