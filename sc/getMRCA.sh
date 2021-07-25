#!/bin/sh

usage()
{
  echo "usage:"
  echo "`basename $0` <file> <tree_start> <tree_end>"

}
if [ "$#" -lt 3 ];then
   usage
   exit 1
fi

file=$1
tree_start=$2
tree_end=$3
index=$tree_start

while [ "$index" -le "$tree_end" ]
do
  echo "`basename $0` index:$index" >& 1
  res=`grep "Tree:$index," $file  |awk -F, '{print $4 ":" $7}' |awk -F: '{print $2 " " $4}' |awk '{a+=$1;b+=$2} END {print "SumOfTree:" NR "averLocalMRCA:" a/NR ",averGrandMRCA:" b/NR}'`
  echo "Tree:$index,$res" >& 2
  index=`expr $index + 1`
done
