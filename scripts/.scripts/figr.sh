FILE_TYPE=$1
GREP_EXP=$2

find . -name "*.$1" -exec grep -nH --color=auto "$2" {} \;
