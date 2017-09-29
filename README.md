# Dropwizard gradle

A minimal Dropwizard getting started project using Gradle. Use [shadowJar plugin](https://github.com/johnrengelman/shadow) to create fat jars. 

To create a fat jar:
```
./gradlew shadowJar
```

## Testing

To run your application:
```
java -jar build/libs/dropwizard-gradle-1.0-SNAPSHOT-all.jar server hello-world.yml
```

You could run the application using Docker with this command

```
./run.sh
```

```
kubectl create configmap nginx-config --from-file=nginx.conf
cd ssl
kubectl create secret generic nginx-ssl \
     --from-file=./nginx.crt --from-file=./nginx.key
```

## Using Ingress Contoller in GKE

```
export CLUSTER_NAME=ziyou
gcloud compute addresses create $CLUSTER_NAME-ip --region <region>
export LB_ADDRESS_IP=$(gcloud compute addresses list | grep $CLUSTER_NAME-ip) | awk ‘{print $3}’

gcloud container clusters create $CLUSTER_NAME --disable-addons HttpLoadBalancing --disk-size=30 --machine-type=<machine-type> --num-nodes=1
gcloud container clusters get-credentials $CLUSTER_NAME

export LB_INSTANCE_NAME=$(kubectl describe nodes | head -n1 | awk '{print $2}')
export LB_INSTANCE_NAT=$(gcloud compute instances describe $LB_INSTANCE_NAME --zone <sub-region> | grep -A3 networkInterfaces: | tail -n1 | awk -F': ' '{print $2}')


gcloud compute instances delete-access-config $LB_INSTANCE_NAME --zone <sub-region> \
    --access-config-name "$LB_INSTANCE_NAT"
gcloud compute instances add-access-config $LB_INSTANCE_NAME  --zone <sub-region> \  
    --access-config-name $LB_INSTANCE_NAT --address $LB_ADDRESS_IP

kubectl label nodes $LB_INSTANCE_NAME role=load-balancer
gcloud compute instances add-tags $LB_INSTANCE_NAME --tags http-server,https-server

kuebectl apply -f nginx-ingress-controller.yaml
kubectl create -f container-engine-ingress.yaml
```


