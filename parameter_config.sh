#!/bin/bash

sudo swapoff -a
echo 'vm.max_map_count=262144' | sudo tee /etc/sysctl.conf
sudo sysctl -p
