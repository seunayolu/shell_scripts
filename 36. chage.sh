#!/bin/bash

set -e  # Exit on any error

NUM_USERS="${1:-5}"
USER_PREFIX="${2:-user}"

for i in $(seq 1 "$NUM_USERS"); do
    USERNAME="${USER_PREFIX}${i}"

    # Generate a random 12-character password. Adjust length as needed.
    PASSWORD="$(openssl rand -base64 12)"

    # Check if the user already exists.
    if id "$USERNAME" &>/dev/null; then
        echo "User '$USERNAME' already exists, skipping..."
        continue
    fi

    # Create the user with a home directory and Bash shell.
    sudo useradd -m -s /bin/bash "$USERNAME"

    # Set the password.
    echo "${USERNAME}:${PASSWORD}" | sudo chpasswd

    # Force the user to change password on next login:
    # Option 1: Using chage
    sudo chage -d 0 "$USERNAME"

    # OR Option 2: Using passwd -e (expire immediately):
    # sudo passwd -e "$USERNAME"

    echo "Created user '$USERNAME' with temporary password: $PASSWORD"
    echo "Password is set to expire at first login."
    echo
done

echo "Completed creating $NUM_USERS user(s) with prefix '$USER_PREFIX'."
