#!/bin/sh
ALLOWED_RELEASES=6

if [ -z $1 ]; then
  echo "An argument is missing! Give me some directory."
  exit 1
fi

if [ ! -d $1 ]; then
  echo "$1 is not a valid directory."
  exit 1
fi

cd $1

for x in `ls -1`; do
  len=`expr length $x`
  if [ $len != 14 ]; then
    echo "$x is not a valid capistrano release directory."
    exit 1
  fi
done


total=`ls -1 | wc -l`
total=$(( $total - $ALLOWED_RELEASES ))
if [ $total -ge 0 ]; then
  to_remove=`ls -1 |head -n $total`
  for x in $to_remove; do
    rm -rf $x
  done
fi

echo "Done."
exit 0
