#!/bin/bash

# Initialize sum variable
sum=0

# Loop over numbers from 1000 to 2000
for num in {1000..2000}; do
    # Check if the number contains only digits 0 and 1 using a regex
    if [[ $num =~ ^[01]+$ ]]; then
        # Add the number to the sum
        sum=$((sum + num))
    fi
done

# Print the result
echo "The sum of numbers between 1000 and 2000 with only digits 0 and 1 is: $sum"

