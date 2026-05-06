#!/bin/bash

find ./incoming -type f -name "*.csv" | while read -r file; do
    echo "Processing $file"

filename=$(basename "$file")
before_filename="$file"

if [ -f $file ]
then
    gzip  $file
    echo "Sucessfully Compressed: $filename" >> ./logs/data_ingestion.log
    mv "$file.gz" "./archive/${filename}.gz_$(date +%Y%m%d_H%M%S)"
    echo "$filename moved to archive"
    echo "$(date): Archived $filename" >> ./logs/data_ingestion.log
    echo "Renamed $before_filename into $filename" >> ./logs/data_ingestion.log
fi
done


