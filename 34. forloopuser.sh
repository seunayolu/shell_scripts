#!/bin/bash

# Exit on any error (optional, but often helpful)
set -e

# Number of users to create (default = 10 if not provided as first argument)
NUM_USERS="${1:-10}"

# Prefix for usernames (default = "user" if not provided as second argument)
USER_PREFIX="${2:-user}"

# Loop through the range 1..NUM_USERS
for i in $(seq 1 "$NUM_USERS"); do
    username="${USER_PREFIX}${i}"
    password="P@ssw0rd${i}"

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists, skipping..."
        continue
    fi

    # Create the user with a home directory and Bash shell
    sudo useradd -m -s /bin/bash "$username"

    # Set the user password via chpasswd (reads "username:password" from stdin)
    echo "${username}:${password}" | sudo chpasswd

    # Print user creation info
    echo "Created user '$username' with password '$password'."
done

echo
echo "User account creation complete for $NUM_USERS users (prefix: $USER_PREFIX)."
