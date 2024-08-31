#!/bin/bash

get_ram_usage() {
    # Get memory usage details
    if [[ $(uname) == "Darwin" ]]; then
        total_ram=$(sysctl -n hw.memsize | awk '{print $0/1024/1024/1024}')
        used_ram=$(vm_stat | grep 'Pages active\|Pages speculative\|Pages wired\|Pages purgeable' | awk '{a=substr($NF,1,length($NF)-1);} {sum+=a;} END {printf "%.2f", sum*16384/1024/1024/1024}')
        echo "${used_ram}/${total_ram} GB"
  else
    echo $(free -m | grep "Mem:" | awk '{printf "%.2f/%.2f GB", $3/1024 , $2/1024}')
  fi
}

get_ram_usage
