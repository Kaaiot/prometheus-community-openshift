#!/bin/bash

#download helm
wget ftp://10.2.12.1/pub/builds/helm-v3.18.3-linux-amd64.tar.gz
#wget https://get.helm.sh/helm-v3.18.3-linux-amd64.tar.gz
tar xzf helm-v3.18.3-linux-amd64.tar.gz
mv linux-amd64/helm helm
#helm is now work1/helm
rm -f helm-v3.18.3-linux-amd64.tar.gz
rm -rf linux-amd64

#download cr
wget ftp://10.2.12.1/pub/builds/chart-releaser_1.8.1_linux_amd64.tar.gz
#wget https://github.com/helm/chart-releaser/releases/download/v1.8.1/chart-releaser_1.8.1_linux_amd64.tar.gz
tar xzf chart-releaser_1.8.1_linux_amd64.tar.gz
#cr is now work1/cr
rm -f chart-releaser_1.8.1_linux_amd64.tar.gz

#download yq
wget ftp://10.2.12.1/pub/builds/yq_linux_amd64 -O yq
#wget "https://github.com/mikefarah/yq/releases/download/v4.44.1/yq_linux_amd64" -O yq
chmod +x yq
#yq is now work1/yq

#adding deps
for file in $(find charts/ -name 'Chart.yaml'); do
  ./yq '.dependencies[] | "./helm repo add \(.name) \(.repository)"' $file >> deps.sh
done
bash deps.sh > /dev/null 2>&1
rm -f deps.sh

#building shit
for chart in $(find charts -maxdepth 1 -type d); do
  ./cr package $chart
done
#all stuff is now work1/.cr-release-packages

git remote set-url origin https://github.com/Kaaiot/prometheus-community-openshift.git
#upload packages
./cr upload -o $USERNAME -r prometheus-community-openshift --packages-with-index -p .cr-release-packages -t $TOKEN --push
#create index
./cr index -o $USERNAME -r prometheus-community-openshift --packages-with-index -i . -p .cr-release-packages -t $TOKEN --push

