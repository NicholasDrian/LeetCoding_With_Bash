#!/bin/bash

m_I="1"
m_V="5"
m_X="10"
m_L="50"
m_C="100"
m_D="500"
m_M="1000"

get() {
  n=m_$1; echo ${!n}
}

num=$1

val=$(get ${num: -1})

for (( i=0; i < ${#num} - 1; i++ )); do

  c=$( get "${num:$i:1}" )
  next_c=$( get "${num:$(($i + 1)):1}" )

  if [[ $c -lt $next_c ]]
  then
    val=$(( $val - $c ))
  else
    val=$(( $val + $c ))
  fi

done

echo $val
