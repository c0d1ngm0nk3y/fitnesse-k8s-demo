# How to setup the  demo

## Prerequisites

* k8s cluster and 'kubectl' set up correctly

## Install sample application to test

* Install simple app

```bash
kubectl  apply -n workshop -f ./k8s-config/workshop/simple-app.yaml
kubectl  apply -n workshop -f ./k8s-config/workshop/simple-app-v1.yaml
kubectl  apply -n workshop -f ./k8s-config/workshop/client.yaml
```

* Verify

```bas
./k8s-config/workshop/ping-simple-app-service
```

## Create admin user

* Create resources for admin user

```bash
./k8s-config/workshop/create_user admin
```

* Patch Ingress adress

```bash
kubectl -n workshop get Ingress admin-ingress -o json | jq '.spec.rules[0].host = "admin.ingress.<adress>"' | kubectl apply -f - -n workshop
```

* Add default content to volume

```bash
./sample-application-go/easyfit/copy_content_to_pod admin
```

* Check Ingress adress

```bash
kubectl -n workshop get Ingress admin-ingress -o jsonpath="{.spec.rules[0].host}"
```

## Create N users

```bash
N=5 ./create_users.sh

## Delete users
