#!/bin/bash

# This script runs on remote server,so the path is under same with the path this file unders.
source ./config_parser.sh

opensearch_folder="/home/ec2-user/opensearch"
version=$(extract_config_value plugin_version)
cd ${opensearch_folder}/bin
./opensearch-plugin remove opensearch-ml
yes | ./opensearch-plugin install file:///home/ec2-user/opensearch-ml-$version-SNAPSHOT.zip
