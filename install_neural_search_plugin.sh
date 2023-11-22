#!/bin/bash

source ./config_parser.sh

opensearch_folder="/home/ec2-user/opensearch"
version=$(extract_config_value plugin_version)
cd ${opensearch_folder}/bin
./opensearch-plugin remove opensearch-neural-search
yes | ./opensearch-plugin install file:///home/ec2-user/opensearch-neural-search-$version-SNAPSHOT.zip
