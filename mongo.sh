declare -a arr=("codeDefect" "logicalError" "transactions")
database="logs"
OUT_PATH="exports/"
FROM_URL="mongodb://user:password@ip_address:port""
TO_URL="mongodb://user:password@ip_address:port"

for collectionName in "${arr[@]}"
   do
      echo "${collectionName}"
      mongoexport --uri="${FROM_URL}/${database}?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false"  --collection="${collectionName}"  --out="exports/${collectionName}.json"
      mongoimport --uri="${TO_URL}/${database}?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&directConnection=true&ssl=false"  --collection "${collectionName}" --file "exports/${collectionName}.json"
   done
