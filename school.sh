#!/bin/bash

total_value=$(grep "MADISON SCHOOLS" Property_Tax_Roll.csv | cut -d ',' -f 7)

sum=0
count=0

for value in $total_value; do
    sum=$(echo "$sum + $value" | bc)
    count=$((count + 1))
done

if [ $count -ne 0 ]; then
    average=$(echo "scale=2; $sum / $count" | bc)
    echo "Average TotalAssessedValue: $average"
else
    echo "No data found"
fi

