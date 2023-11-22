#!/bin/bash -x


version=2.8.0
wget https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/$version/opensearch-dashboards-$version-linux-x64.tar.gz

rm -rf opensearch-dashboards
tar -xvf opensearch-dashboards-$version-linux-x64.tar.gz
mv opensearch-dashboards-$version opensearch-dashboards
cd opensearch-dashboards/config
cp ~/opensearch_dashboards.yml ~/opensearch-dashboards/config/