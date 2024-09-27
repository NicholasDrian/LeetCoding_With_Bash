#!/bin/bash

parens=$1
stack=""

for (( i=0 ; i < ${#parens}; i++ )); do

  c="${parens:$i:1}"
  c=$(echo $c | tr "(" "1")
  c=$(echo $c | tr "[" "2")
  c=$(echo $c | tr "{" "3")
  c=$(echo $c | tr ")" "4")
  c=$(echo $c | tr "]" "5")
  c=$(echo $c | tr "}" "6")

  if [[ $c -eq '1' ]]; then
    stack="$stack 4"
  elif [[ $c -eq '2' ]]; then
    stack="$stack 5"
  elif [[ $c -eq '3' ]]; then
    stack="$stack 6"
  elif [[ $stack -eq "" ]]; then
    echo false
    exit 0
  elif [[ ${stack: -1} -eq $c ]]; then
    stack=${stack%??}
  else
    echo false
    exit 0
  fi

done

if [[ $stack -eq "" ]]; then
  echo true
else 
  echo false
fi
