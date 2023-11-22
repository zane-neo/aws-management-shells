#!/bin/bash

restart() {
    opensearch_folder="/home/ec2-user/opensearch"
    output=$(ps -ef | grep opensearch | grep -v grep | grep -v dashboards | awk '{print $2}')
    echo "found opensearch process ${output}"
    kill -9 $output
    sleep 10
    cd ${opensearch_folder} && nohup sh opensearch-tar-install.sh > nohup.log 2>&1 &
    sleep 10
    cd ${opensearch_folder} && tail -n 50 nohup.log
    return 0
}

restart


