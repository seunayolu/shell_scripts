# This script creates ten user accounts on Ubuntu
#!/bin/bash
# Loop to create ten user accounts
for i in {1..10}
do
    username="user$i"
    password="P@ssw0rd$i"
    # Create a user with a home directory and set the password
    sudo useradd -m -s /bin/bash -p $(openssl passwd -1 $password) $username

    # Display user information
    echo "User $username created with password: $password"
done
# Inform the completion of user creation
echo "User accounts creation completed."