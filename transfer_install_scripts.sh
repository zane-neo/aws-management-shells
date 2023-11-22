#!/bin/bash -x

base_path=/Users/zaniu/Documents/opensearch-configs/shells

$base_path/scp_to_remote.sh $base_path/install_opensearch.sh $1
$base_path/scp_to_remote.sh $base_path/install_ml_plugin.sh $1
$base_path/scp_to_remote.sh $base_path/install_neural_search_plugin.sh $1
$base_path/scp_to_remote.sh $base_path/start_opensearch_dashboard.sh $1
$base_path/scp_to_remote.sh $base_path/kill_and_restart.sh $1
$base_path/scp_to_remote.sh $base_path/kill_opensearch.sh $1
$base_path/scp_to_remote.sh $base_path/config_parser.sh $1
$base_path/scp_to_remote.sh $base_path/opensearch.yml $1
$base_path/scp_to_remote.sh $base_path/parameter_config.sh $1
$base_path/scp_to_remote.sh $base_path/jvm.options $1
$base_path/scp_to_remote.sh $base_path/esnode-key.pem $1
$base_path/scp_to_remote.sh $base_path/esnode.pem $1
$base_path/scp_to_remote.sh $base_path/root-ca.pem $1
$base_path/scp_to_remote.sh $base_path/opensearch_dashboards.yml $1
$base_path/scp_to_remote.sh $base_path/install_opensearch_dashboard.sh $1

