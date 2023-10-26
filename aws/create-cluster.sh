eksctl create nodegroup \
  --cluster project3-cluster \
  --region us-east-1 \
  --name project3-cluster\
  --node-ami-family ami-family \
  --node-type m5.large \
  --nodes 2 \
  --nodes-min 2 \
  --nodes-max 3 \
