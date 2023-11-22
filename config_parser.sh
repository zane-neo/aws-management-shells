#!/bin/bash

function extract_config_value() {
  while read line; do    
    # echo $line
    arrIN=(${line//=/ })
    key=${arrIN[0]}
    if [[ $key == $1 ]];then
      f_value=${arrIN[1]}
      break
    fi
  done < config.properties
  echo "$f_value"
}
