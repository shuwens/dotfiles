#!/bin/bash

if [ $# -lt 0 ] ; then
  file_path=""
else
  file_path=$1
fi

echo "_main dir_"
tree ${file_path} -d -L 1

# Use () to represent Array, and space separate array elements
declare -a name=( "Go" "Java" "Ruby" "Python" "C" "C++" "JSON" "Lua" "Shell" "Gradle" "YAML" "Rust")
declare -a ext=( "go" "java" "rb" "py" "c" "cpp" "json" "lua" "sh" "gradle" "yml" "rs")
declare -a test_str=( "*test*." "*Test*." "*spec*." "*test*." "*test*." "*test*." "*test*." "*test*." "*test*." "*test*." "*test*."  "*test*." )
total=( 0 0 0 0 0 0 0 0 0 0 0 0 )
run=( 0 0 0 0 0 0 0 0 0 0 0 0 )
test=( 0 0 0 0 0 0 0 0 0 0 0 )
declare -a grep_c=( "^//.*\|" "^//.*\|" "^#.*\|" "^#.*\|" "^//.*\|" "^//.*\|" "" "^#.*\|" "^#.*\|" "" "" )

function find_code(){

  grep_str=$5"^$"
  #echo $grep_str

  # regx: "^$\|^//.*" 
  # Use regular expressin to filter blank lines and comments
  total_code=$(find . -name "*.$2"  -print0 | xargs -0 grep -v "$grep_str" | wc -l)
  #if [ "       0" = "${total_code}" ];then
  if [ 0 -eq ${total_code} ];then
    return
  fi

  total_code=${total_code% }
  #echo ${test_str[$1]}$2 
  test_code=$(find . -name "${test_str[$1]}$2"  -print0 | xargs -0 grep -v "$grep_str" | wc -l)
  #if [ "       0" != "${test_code}" ];then
  if [ 0 -ne ${test_code} ];then
    #test_code=${test_code% total}
    run_code=`expr ${total_code} - ${test_code}`
    total[$1]=`expr ${total[$1]} + ${total_code}`
    run[$1]=`expr ${run[$1]} + ${run_code}`
    test[$1]=`expr ${test[$1]} + ${test_code}`
    printf "$4%-6s: In all [ %-6d], Run code [ %-6d], Test code [ %-6d]\r\n" $3 ${total_code} $run_code ${test_code}
  else
    #echo "$4$3：总计["${total_code}" ]"
    printf "$4%-6s: Total code [ %-6d]\r\n" $3 ${total_code}
    total[$1]=`expr ${total[$1]} + ${total_code}`
    run[$1]=`expr ${run[$1]} + ${total_code}`
  fi
}

function scan_code_dir(){
  #echo `ls ${file_path}`

  for dir in `ls ${file_path}`
  do
    if test -d ${dir} && ! test -L ${dir};then
      cd ${dir}
      fmt_com="│   ├── "
      fmt_last="│   └── "

      echo "├── $dir"
      for index in 0 1 2 3 4 5 6 7 8 9
      do
        find_code ${index} ${ext[$index]} ${name[$index]} "$fmt_com" ${grep_c[$index]}
      done
      find_code 10 "yml" "YAML" "$fmt_last"
      cd ..
    fi
  done
}

echo "_Code count:_"
echo "."
scan_code_dir

echo
echo "_Total count:_"
printf "%-8s    %-8s    %-8s    %-8s\r\n" "Lang" "In all" "Run code" "Test code"
for index in 0 1 2 3 4 5 6 7 8 9 10
do
  if [ 0 != ${total[$index]} ];then
    printf "%-8s    %-8d    %-10d    %-8d\r\n" "${name[$index]}"  ${total[$index]} ${run[$index]} ${test[$index]}
  fi
done
