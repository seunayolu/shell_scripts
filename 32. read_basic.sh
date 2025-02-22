#!/bin/bash

# Prompt for the user's name
echo "What is your name?"
read USER_NAME

# Prompt for the user's favorite color
echo "Hello, $USER_NAME. What is your favorite color?"
read FAVORITE_COLOR

# Display a summary of the information
echo
echo "Nice to meet you, $USER_NAME! it good to know that your favorite color is $FAVORITE_COLOR."
echo