find . -type f -name "*.java" -print0 | xargs  -0 sed -i -E "s/\(@Schema.*\) value \= /\1description = /"
