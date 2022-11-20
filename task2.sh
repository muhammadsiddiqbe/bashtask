file="$1"

head -n 1 $file; # get the first line
# tail -n 1 $file # get the last line

IN="bla@some.com;john@home.com"
arrIN=(${IN//;/ })
echo ${arrIN[1]}                  # Output: john@home.com