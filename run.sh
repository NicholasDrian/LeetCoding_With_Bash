#!/bin/bash

if [ $# -eq 0 ]; then
  echo "run what? (missing arg)"
fi

printf "\ntesting %s...\n\n" $1 

input_file_path="./$1/in.txt"
output_file_path="$1/out.txt" 
solution_file_path="$1/solution.sh"

test_count=($(wc -l $input_file_path))
test_count=${test_count[0]}

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

passed=0

for test_index in $(seq 1 $test_count); do
  echo "  running test $test_index..."

  input=$(awk "NR==$test_index" $input_file_path)
  echo "    input: $input"

  expected_output=$(awk "NR==$test_index" $output_file_path)
  echo "    expected output: $expected_output"

  output=$(source $solution_file_path "$input")
  echo "    actual output: $output"

  if [[ $output == $expected_output ]];
  then
    printf "    ${GREEN}PASSED!${NC}\n"
    passed=$(($passed + 1))
  else
    printf "    ${RED}FAILED!${NC}\n"
  fi

done

if [[ $passed == $test_count ]]; 
then 
  printf "\n  ${GREEN}ALL TESTS PASSED!${NC}\n\n"
else
  printf "\n  ${RED}$((test_count - passed)) TESTS FAILED${NC}\n\n"
fi


