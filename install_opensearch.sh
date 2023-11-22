#!/bin/bash -x


# https://ci.opensearch.org/ci/dbc/distribution-build-opensearch/2.11.0/8624/linux/x64/tar/dist/opensearch/opensearch-2.11.0-linux-x64.tar.gz 
# https://ci.opensearch.org/ci/dbc/distribution-build-opensearch/2.11.0/6325/mac/x64/tar/dist/opensearch/opensearch-2.11.0-mac-x64.tar.gz 
source ./config_parser.sh
version=$(extract_config_value opensearch_version)
source=$(extract_config_value opensearch_source)
ci_build_no=$(extract_config_value ci_build_no)
platform=$(extract_config_value platform)
rm -rf opensearch-$version-linux-$platform.tar.gz
if [ "$source" = "ci" ];
then
    wget https://ci.opensearch.org/ci/dbc/distribution-build-opensearch/$version/$ci_build_no/linux/$platform/tar/dist/opensearch/opensearch-$version-linux-$platform.tar.gz
elif [ "$source" = "min_snapshot" ];
then
    wget -O opensearch-$version-linux-$platform.tar.gz https://artifacts.opensearch.org/snapshots/core/opensearch/$version-SNAPSHOT/opensearch-min-$version-SNAPSHOT-linux-$platform-latest.tar.gz
else
    wget https://artifacts.opensearch.org/releases/bundle/opensearch/$version/opensearch-$version-linux-$platform.tar.gz
fi

rm -rf opensearch
tar -xvf opensearch-$version-linux-$platform.tar.gz
if [ "$source" = "ci" ];then
    mv opensearch-$version opensearch
elif [ "$source" = "org" ];then
    mv opensearch-$version opensearch
else
    mv opensearch-$version-SNAPSHOT opensearch
fi
./parameter_config.sh
cp opensearch.yml opensearch/config
cp jvm.options opensearch/config
cd ~/opensearch
cp ~/esnode-key.pem ~/opensearch/config/
cp ~/esnode.pem ~/opensearch/config/
cp ~/root-ca.pem ~/opensearch/config/