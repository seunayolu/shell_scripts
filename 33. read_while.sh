#!/bin/bash

# Prompt for the user's name, ensure non-empty response
while true; do
    echo "What is your name?"
    read USER_NAME

    # Check if the user actually typed something
    if [ -n "$USER_NAME" ]; then
        break  # Exit the loop if USER_NAME is not empty
    else
        echo "Name cannot be empty. Please try again."
    fi
done

# Prompt for the user's favorite color, ensure non-empty response
while true; do
    echo "Hello, $USER_NAME. What is your favorite color?"
    read FAVORITE_COLOR

    if [ -n "$FAVORITE_COLOR" ]; then
        break
    else
        echo "Favorite color cannot be empty. Please try again."
    fi
done

# Display a summary of the information
echo
echo "Nice to meet you, $USER_NAME! it good to know that your favorite color is $FAVORITE_COLOR."
echo 