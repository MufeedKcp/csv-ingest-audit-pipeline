#!/bin/bash

find /mnt/c/Users/biten/OneDrive/Documents/linux_project_sales_files/incoming -type f -name "*.csv" | while read -r file; do
    /usr/bin/echo "Processing $file"

filename=$(basename "$file")

if [ -f $file ]
then
    gzip  $file
    /usr/bin/echo "Sucessfully Compressed: $filename" >> /mnt/c/Users/biten/OneDrive/Documents/linux_project_sales_files/logs/data_ingestion.log
    mv "$file.gz" "/mnt/c/Users/biten/OneDrive/Documents/linux_project_sales_files/archive/${filename}.gz_$(/usr/bin/date +%Y%m%d_H%M%S)"
    /usr/bin/echo "$filename moved to archive"
    /usr/bin/echo "$(/usr/bin/date): Archived $filename" >> /mnt/c/Users/biten/OneDrive/Documents/linux_project_sales_files/logs/data_ingestion.log
fi
done


