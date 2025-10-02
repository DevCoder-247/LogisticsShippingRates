#!/bin/bash

# Simple Interest Calculator Script
# Formula: SI = (P * R * T) / 100
#
# P = Principal Amount
# R = Annual Rate of Interest
# T = Time in Years

echo "--- Simple Interest Calculator ---"

# 1. Get Principal Amount (P)
read -p "Enter Principal Amount (P): " P

# 2. Get Annual Rate of Interest (R)
read -p "Enter Annual Interest Rate (R, e.g., 5.5 for 5.5%): " R

# 3. Get Time in Years (T)
read -p "Enter Time in Years (T): " T

# Input validation (Basic check to ensure variables are not empty)
if [[ -z "$P" || -z "$R" || -z "$T" ]]; then
    echo "Error: All three values (Principal, Rate, Time) must be provided."
    exit 1
fi

# Calculate Simple Interest and Total Amount using 'bc' for floating-point math.
# 'scale=2' ensures the result is rounded to two decimal places (currency format).
SIMPLE_INTEREST=$(echo "scale=2; ($P * $R * $T) / 100" | bc)
TOTAL_AMOUNT=$(echo "scale=2; $P + $SIMPLE_INTEREST" | bc)

echo "-----------------------------------"
echo "Principal: $P"
echo "Rate:      $R%"
echo "Time:      $T years"
echo "-----------------------------------"
echo "Simple Interest Earned (SI): $SIMPLE_INTEREST"
echo "Total Amount (P + SI):       $TOTAL_AMOUNT"
echo "-----------------------------------"

# Note: Before running, make sure to make the script executable:
# chmod +x simple-interest.sh
