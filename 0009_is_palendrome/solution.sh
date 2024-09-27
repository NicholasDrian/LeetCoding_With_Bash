#!/bin/bash
num=$1
len=${#num}
p1=0
p2=$(($len - 1))
while [[ p1 -lt p2 ]]; do
 
  if [[  ${num:$(($p1)):1} -ne  ${num:$(($p2)):1} ]]; then
    echo false
    exit 0
  fi

  p1=$(( $p1 + 1 ))
  p2=$(( $p2 - 1 ))

done

echo true


