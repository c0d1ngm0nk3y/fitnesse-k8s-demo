How to setup the  demo

## Prerequisite

* k8s cluster and 'kubectl' set up correctly

## Install sample application to test

* Install samole app

```bash
$ kubectl  apply -n workshop -f ./k8s-config/workshop/sample-app.yaml
$ kubectl  apply -n workshop -f ./k8s-config/workshop/sample-app-v1.yaml
$ kubectl  apply -n workshop -f ./k8s-config/workshop/client.yaml
```


* Verify

```
$ ./k8s-config/workshop/ping-sample-app-service
```


## Create admin user

* Create resources for admin user

```bash
$  ./k8s-config/workshop/create_user admin
```

* Patch Ingress adress

* Add default content to volume

```bash
$ ./sample-application-go/easyfit/copy_content_to_pod admin
```
* Check Ingress adress

```bash
$ kubectl -n workshop get Ingress admin-ingress -o jsonpath="{.spec.rules[0].host}"
```

## Create N users

## Delete users