gcloud container clusters get-credentials terraform-test-cluster --zone us-central1-b --project gabriel-garrido

sleep 2
kubectl get pods

sleep 2
kubectl create serviceaccount --namespace kube-system tiller

sleep 2
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

sleep 2
helm init --service-account tiller --upgrade

sleep 30
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
