#!/bin/bash

#######################################################################

#-- DISCLAIMER:
# This is open sourced bash script originally from -wabcwang- 
# (https://github.com/wabcwang/code_stat) and I have used and changed over 
# time, you are free to change or use it.  

#-- AUTHOR:
#-- wabcwang

#-- CONTRIBUTOR:
#-- -jethros- jethro.sun7@gmail.com

#######################################################################

#-- CHANGES:
#-- 09/25/17 -jethros- Adding some amount of changes but made the script a bit
#--                    messy.
#-- 12/04/18 -jethros- Improved the script so that now we can also pass in a
#--                    argument as the only directory we are interested in
#--                    taking a look at.

#######################################################################
ONLY_FILE_PATH=""

if [ -z "$1" ]
then
	if [ $# -lt 0 ] ; then
		FILE_PATH=""
		#echo "DEBUG: cond 1"
		#echo $FILE_PATH
	else
		#echo "DEBUG: cond 2"
		FILE_PATH=$1
		#echo $1
		echo $FILE_PATH
	fi
else
	#echo "DEBUG: the dir we want to peek into is..."
	ONLY_FILE_PATH=$1
fi

echo "__main dir__"
tree ${FILE_PATH} -d -L 1

#-- Here only a list of program languages are detected and counted.

# Use () to represent Array, and space separate array elements
declare -a name=( "Go" "Java" "Ruby" "Python" "C" "C++" "JSON" "Rust" "Shell" "Gradle" "YAML" )
declare -a ext=( "go" "java" "rb" "py" "c" "cpp" "json" "rs" "sh" "gradle" "yml" )
declare -a test_str=( "*test*." "*Test*." "*spec*." "*test*." "*test*." "*test*." "*test*." "*test*." "*test*." "*test*." "*test*." )
total=( 0 0 0 0 0 0 0 0 0 0 0 )
run=( 0 0 0 0 0 0 0 0 0 0 0 )
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
	#echo `ls ${FILE_PATH}`
	for dir in `ls ${FILE_PATH}`
	do
		#echo $dir
		if test -d ${dir} && ! test -L ${dir};then
			cd ${dir}
			#echo ${dir}
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

function scan_only_one_code_dir(){
	for dir in `ls`
	do
		if test -d ${dir} && ! test -L ${dir};then
			#echo "DEBUG: passed both tests...."
			cd ${dir}
			#echo ${dir}
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

echo "__Code count:__"

if [ -z $ONLY_FILE_PATH ]; then
	#echo "ONLY_FILE_PATH not exist"
	echo "."
	scan_code_dir
else
	echo
	echo $ONLY_FILE_PATH
	cd $ONLY_FILE_PATH
	scan_only_one_code_dir
fi


echo
echo "__Total count:__"
printf "%-8s    %-8s    %-8s    %-8s\r\n" "Lang" "In all" "Run code" "Test code"
echo "-----------------------------------------------"
for index in 0 1 2 3 4 5 6 7 8 9 10
do
	if [ 0 != ${total[$index]} ];then
		printf "%-8s    %-8d    %-10d    %-8d\r\n" "${name[$index]}"  ${total[$index]} ${run[$index]} ${test[$index]}
	fi
done
