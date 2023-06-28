#!/bin/bash

# API endpoint
apiURL="https://katanime.vercel.app/api/getrandom"

# Fetch the API response
response=$(curl -s "$apiURL")

# Check if the API request was successful
if [[ $? -eq 0 ]]; then
  # Parse the JSON response
  english=$(echo "$response" | jq -r '.result[0].english')

  # Check if the "english" value exists
  if [[ $english != "null" ]]; then
    echo "$english"
  else
    echo "No 'english' value found in the response."
  fi
else
  echo "Failed to fetch API data."
fi

