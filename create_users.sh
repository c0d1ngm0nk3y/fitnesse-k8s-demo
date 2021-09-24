#!/bin/env bash

set -eu

N=$1
SCRIPTDIR=$( dirname "${BASH_SOURCE[0]}" )

for i in  $(seq  $N);  do
  NAME=tester-$i
  ./$SCRIPTDIR/k8s-config/workshop/create_user $NAME
  kubectl rollout status deployment/$NAME -n workshop
  ./$SCRIPTDIR/sample-application-go/easyfit/copy_content_to_pod $NAME
done

sleep  3

kubectl get  pods  -n  workshop
kubectl -n workshop get Ingress
kubectl  get nodes


