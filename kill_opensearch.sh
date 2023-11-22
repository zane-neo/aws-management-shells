#!/bin/bash

kill -9 `ps -ef | grep opensearch | grep -v grep | grep -v dashboards | awk '{print $2}'`