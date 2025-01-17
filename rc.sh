#! /bin/sh

echo "Please input readable fasta file with the file extension .fa; use the tab>
read -e fasta_file

if [ $# -lt 1 ] || [ $# -gt 1 ];then
echo "Error: Incorrect number of files. Terminating Program."
exit
else echo "$fasta_file uploaded. Processing..."
fi

#initialize variable
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`

echo "Name: $name"

#calculate length of sequence
len=${#sequence}

echo "Length: $len"

#use rc variable set to rev command and tr to do a reverse compliment of the input file. 
rc=`echo $sequence | rev | tr 'ATGCatgc' 'TACGtacg'`

echo "$sequence
$reverse
"

#complement sequence
rc=`echo $reverse | tr 'atcg' 'tagc'`

echo "$rc
"

echo $name >$1.rc.txt
echo $rc >>$1.rc.txt

