#!/bin/bash

input=$1
IFS='|' read -ra split_input <<< "$input"

nums=(${split_input[0]})
target=${split_input[1]}



for i in $(seq 0 $((${#nums[@]} - 2))); do
  for j in $(seq $(($i + 1)) $((${#nums[@]} - 1))); do
    if [ $(( ${nums[$i]} + ${nums[$j]} )) -eq $target ]; then
      echo "$i $j"
    fi
  done
done

