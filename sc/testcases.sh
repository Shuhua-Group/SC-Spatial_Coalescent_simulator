#!/bin/sh
DIR=`dirname $0`

#case1
#command="./macs 100 1e6 -t 1e-4 -r 1e-4 -h 1e2 -i 1000"

#case2 the value in Gary's paper
#command=".my/macs 20 167000 -r 6e-4 -h 1000 -i 10000"
seqlen=167000
keep=$seqlen
if [ "$1" != "" ];then
  keep=$1
  if [ "$keep" -lt 0 ];then
    echo "keep value is illegal!"
    exit 1
  fi
fi
command="./sc 20 $seqlen -r 6e-4 -h $keep -T -i 1000000"
#command="./sc 20 $seqlen -r 6e-4 -h $keep -T -i 100000"
#command="./sc 20 $seqlen -r 6e-4 -h $keep -T -i 10"

#case for test
#command="./macs 20 1000 -r 1e-1 -h 10 -i 10"
#command="./macs 10000 1e6 -t .001 -r .001 -h 1e2"
#command="./macs 100 1e7 -t .00001 -r .00001 -h 1e2"

cd $DIR

mkdir -p ../output
tree_file=../output/trees.$$.txt
echo "$command" > $tree_file
echo "TimeBegin:`date`" >> $tree_file
$command >> $tree_file 2>&1
echo "TimeEnd:`date`" >> $tree_file

result_file=../output/result.$$.txt
#echo "$command" > $result_file

#echo "getting MRCA from $tree_file"
#./getMRCA.sh $tree_file 0 100 2>> $result_file

#head -15 $result_file
#index=1
#count=1000
#while [ "$index" -le $count ]
#do
#  echo "index: $index"
#  $command 2>output/trees.$index.txt 1>output/sites.$index.txt
#  index=`expr $index + 1`
#done
