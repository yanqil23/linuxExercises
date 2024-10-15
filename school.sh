#!/bin/bash

# Step 1: Use cat to output the file (or head for debugging)
cat Property_Tax_Roll.csv |

# Step 2: Use grep to filter lines containing "MADISON SCHOOLS"
grep "MADISON SCHOOLS" |

# Step 3: Use cut to extract the 7th column (TotalAssessedValue)
cut -d ',' -f 7 |

# Step 4: Use awk to calculate the sum and average
awk '{sum += $1; count += 1} END {print "Average TotalAssessedValue:", sum / count}'

