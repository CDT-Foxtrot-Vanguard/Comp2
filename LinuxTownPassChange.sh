#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Define an associative array with usernames and their corresponding passwords
declare -A users_passwords=(
    [monk]="Cowboy5-Farmer-Explain-Above-Stop-Had"
    [LSeelie]="Nearest-Climb-Front-Weather-Plates0-Nodded"
)

# Loop through the usernames
for user in "${!users_passwords[@]}"; do
    # Check if the user exists
    if id "$user" &>/dev/null; then
        # Set the password for the user
        echo "$user:${users_passwords[$user]}" | sudo chpasswd
        echo "Password for user '$user' has been set."
    else
        echo "User '$user' does not exist."
    fi
done