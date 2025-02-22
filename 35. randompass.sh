#!/bin/bash

set -e

NUM_USERS="${1:-10}"
USER_PREFIX="${2:-user}"

for i in $(seq 1 "$NUM_USERS"); do
    username="${USER_PREFIX}${i}"
    
    # Generate a random 12-character password. Feel free to adjust length as needed.
    password="$(openssl rand -base64 12)"

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists, skipping..."
        continue
    fi

    # Create the user with home directory and bash shell
    sudo useradd -m -s /bin/bash "$username"

    # Set the user password
    echo "${username}:${password}" | sudo chpasswd

    # Print user creation info
    # NOTE: If you don’t want to reveal the password, omit it or store it securely.
    echo "Created user '$username' with password: $password"
done

echo
echo "User account creation complete for $NUM_USERS users (prefix: $USER_PREFIX)."
