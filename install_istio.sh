cd ch*12
export ISTIO_VERSION=1.10.0
curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:$PWD/istio-1.10.0/bin"
istioctl manifest install --set profile=demo
istioctl manifest generate --set profile=demo > istio-kind.yaml
istioctl verify-install -f istio-kind.yaml

kubectl apply -f prometheus-deployment.yaml
kubectl apply -f jaeger-deployment.yaml
helm install --namespace istio-system --set auth.strategy="anonymous" --repo https://kiali.org/helm-charts kiali-server kiali-server

sh expose_istio.sh
cd kiali
sh create-kiali-istio-objs.sh
cd ../
kubectl apply -f create-kiali-ingress.sh
cd example-app
kubectl create ns demo
kubectl apply -f istio-manifests.yaml
kubectl apply -f kubernetes-manifests.yaml
./create-gw-vs.sh

cd echoserver
kubectl apply -f echoserver.yaml 
kubectl apply -f echoserver_gw.yaml
