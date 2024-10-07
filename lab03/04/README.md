


for i in `seq 1 10000`
do
curl -s "http://${GATEWAY_URL}/productpage" | grep -o "<title>.*</title>"
sleep 1
done
