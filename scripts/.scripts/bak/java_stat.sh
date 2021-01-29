ALL_CODES=$(find src/ -name "*.java" |xargs cat|wc -l)
MAIN_CODES=$(find src/main -name "*.java" |xargs cat|wc -l)
N_JAVA_FILES=$(find src/main -name "*.java" |wc -l)

echo "Total formal java files in src/main: "$N_JAVA_FILES
echo "Total java code lines in src/main: "$MAIN_CODES
echo "Total java code lines in src(including test): "$ALL_CODES

