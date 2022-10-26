## Install Argo
```shell
cd argo-cd
./install.sh
```


## Change service 
Service Type Load Balancer

Change the argocd-server service type to LoadBalancer:

```
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
## Get minikube ip
```
minikube ip

192.168.49.2

```
## Get port of the service argocd-server
```shell
kubectl get svc/argocd-server -n argocd
NAME            TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)                      AGE
argocd-server   LoadBalancer   10.98.97.22   <pending>     80:31490/TCP,443:32217/TCP   152m

```
## GET Credentials
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## Acess Argo UI on Browser

- example http://192.168.49.2:31490

## Istall Argocd Cli
```
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

## Login in Argo CLI
```
argocd login <ARGOCD_SERVER>
```
## Change Admin Password
```
argocd account update-password
```

## Crete um Deploy on Argo CLI
```
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default

```
