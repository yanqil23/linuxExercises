#!/bin/bash

cat Property_Tax_Roll.csv |
grep "MADISON SCHOOLS" |
cut -d ',' -f 7 |
{
    sum=0
    count=0

    while read -r value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done

    if [ $count -ne 0 ]; then
        average=$(echo "scale=2; $sum / $count" | bc)
        echo "Average TotalAssessedValue: $average"
    else
        echo "No data found"
    fi
}