#!/bin/bash

str=$1

biggest() {

  ptr1=$1
  ptr2=$2
  size=$3

  while [ $ptr1 -ge 0 -a $ptr2 -lt $size -a ${str:$ptr1:1} == ${str:$ptr2:1} ]; do 
    ptr1=$(($ptr1 - 1)) 
    ptr2=$(($ptr2 + 1)) 
  done

  ptr1=$(($ptr1 + 1)) 
  ptr2=$(($ptr2 - 1)) 
  len=$(($ptr2 - $ptr1 + 1))
  if [ $len -gt 0 -a ${str:$ptr1:1} == ${str:$ptr2:1} ]; then
    echo ${str:$ptr1:$len}
  else 
    echo ""
  fi

}

res=""

for (( i=0; i < ${#str} - 1; i++ )); do

  temp=$(biggest $i $i ${#str})
  if [[ ${#temp} -gt ${#res} ]]; then
    res=$temp
  fi

  temp=$(biggest $i $(($i + 1)) ${#str})
  if [[ ${#temp} -gt ${#res} ]]; then
    res=$temp
  fi

done

echo $res
