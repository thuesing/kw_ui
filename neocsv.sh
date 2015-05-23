#!/bin/sh
# needs 1 params for Sektor Massnahme  
if [ $# -ne 1 ] 
 then 
  echo "Hi. Wrong param. Awaiting Cypher Query Json File.json "
  exit
 fi

# curl neo 7474
curl \
 	-d @$1 -o result.json -H accept:application/json -H content-type:application/json -H X-Stream:true \
	http://localhost:7474/db/data/cypher

# get last exit code
RET=$?
if [ $RET != 0 ]
  then
    exit $RET
fi

# remove .json appendix
#FILENAME=$(sed "s/.json//g" <<< $1)
FILENAME=$(echo $1 | sed 's/.json//g')

sed -e 's/{"columns"://g' \
-e 's/\]\]}//g' \
-e 's/"data"://g' \
-e 's/\[\+//g' \
-e 's/\],/\n/g' \
./result.json > ${FILENAME}.csv

#rm ./result.json

echo "${FILENAME}.csv done"




