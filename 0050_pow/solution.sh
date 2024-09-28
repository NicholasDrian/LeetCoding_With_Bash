
input=$1
IFS='|' read -ra split_input <<< "$input"

a=${split_input[0]}
b=${split_input[1]}


# TODO: strip trailing zeros after decimal point and increase size

pow() {

  a=$1
  b=$2
   
  if [[ $b -eq 0 ]]; then
    echo 1
    return 0
  fi

  if [[ $b -lt 0 ]]; then
    a=$(echo "scale=3; 1 / $a" | bc)
    b=$(($b * -1))
  fi

  res=$(pow $a $(($b / 2)))

  if [[ $(($b % 2)) -eq 1 ]]; then
    echo $(echo "scale=3; $res * $res * $a" | bc)
  else
    echo $(echo "scale=3; $res * $res" | bc)
  fi

}

echo $(pow $a $b)
