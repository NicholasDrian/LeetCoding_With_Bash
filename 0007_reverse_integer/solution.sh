#!/bin/bash

num=$1

strip_leading_zeros() {
  res=$(expr $1 + 0)
  echo $res
}

if [[ $num -lt 0 ]]; then
  num=$(($num * -1))
  reversed=$(echo $num | rev)
  echo "-$(strip_leading_zeros $reversed)"
else
  reversed=$(echo $num | rev)
  echo "$(strip_leading_zeros $reversed)"
fi



