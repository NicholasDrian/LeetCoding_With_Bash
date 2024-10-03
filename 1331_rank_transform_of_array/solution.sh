#!/bin/bash

nums=($1)
sorted=$(echo "${nums[@]}" | tr ' ' '\n' | sort -n | tr '\n' ' ')

without_duplicates=()
prev=""
for num in ${sorted[@]}; do 
  if [[ $num -ne $prev ]]; then
    without_duplicates=("${without_duplicates[@]}" $num)
  fi
  prev=$num
done

position_of() {

  target=$1
  shift
  arr=($@)
  i=1
  for num in ${arr[@]}; do
    if [[ $target -eq $num ]]; then
      echo $i
      return 0
    fi
    i=$(( i + 1 ))
  done
  echo -1
}

res=()
for num in ${nums[@]}; do
  res="$res $(position_of $num ${without_duplicates[@]})"
done
echo $res


