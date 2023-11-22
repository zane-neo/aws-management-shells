#!/bin/bash

kill -9 `lsof -i:9200 | grep -v Postman | awk '{print $2}'`
