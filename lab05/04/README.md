
## Install kafka of bitnami using helm.
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm show values bitnami/kafka > values.yaml
```

To create a pod that you can use as a Kafka client run the following commands:
```
    kubectl run kafka-client --restart='Never' --image docker.io/bitnami/kafka:3.3.1-debian-11-r1 --namespace default --command -- sleep infinity
    kubectl exec --tty -i kafka-client --namespace default -- bash

    PRODUCER:
        kafka-console-producer.sh \
            --broker-list kafka-headless:9092 \
            --topic demo

    CONSUMER:
        kafka-console-consumer.sh \
            --bootstrap-server kafka.default.svc.cluster.local:9092 \
            --topic test \
            --from-beginning
```
## List topics
```
kubectl exec -it kafka-client -- kafka-topics.sh \
--bootstrap-server kafka-headless:9092 --list 
```

## Create demo Topic
```
kubectl exec -it kafka-client -- kafka-topics.sh --bootstrap-server kafka-headless:9092 --topic demo --create --replication-factor 1 --partitions 1
```

## Send message using kafka-console-producer
```
kubectl exec -it kafka-client -- kafka-console-producer.sh \
--broker-list kafka-headless:9092 \
--topic demo
```

## Receive message using kafka-console-consumer
```
kubectl exec -it kafka-client -- kafka-console-consumer.sh \
--bootstrap-server kafka-headless:9092 \
--topic demo \
--from-beginning


kubectl exec -it kafka-client -- kafka-console-consumer.sh \
--bootstrap-server kafka-headless:9092 \
--topic test \
--from-beginning
```