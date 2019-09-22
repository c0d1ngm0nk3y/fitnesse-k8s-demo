#!/bin/sh

set -eu

N=$1
SCRIPTDIR=$( dirname "${BASH_SOURCE[0]}" )

for i in  $(seq  $N);  do
  NAME=user-$i
  ./$SCRIPTDIR/k8s-config/workshop/create_user $NAME
  kubectl rollout status deployment/$NAME -n workshop
  ./$SCRIPTDIR/sample-application-go/easyfit/copy_content_to_pod $NAME
  kubectl -n workshop get Ingress $NAME-ingress -o json | jq --arg n $NAME --arg c "prometheus" '.spec.rules[0].host = "\($n).ingress.\($c).d050893.shoot.canary.k8s-hana.ondemand.com"' | kubectl apply -f - -n workshop
done

sleep  3

kubectl get  pods  -n  workshop
kubectl -n workshop get Ingress
kubectl  get nodes


