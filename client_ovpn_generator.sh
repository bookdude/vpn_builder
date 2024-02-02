#!/bin/bash

#this script generates a .txt file with the ovpn file contents including the client name prefix and the range of host numbers.
#the script usees the format:

# 1
# {Prefix}{num}
# 1
# 
# 1
# {Prefix}{num+1}
# 1
# 

#This file is then piped into a seperate .sh file that will generate the ovpn files and place them in the correct directory.
# Exampled ./openvpn-install.sh < depolyfile.sh

# This script will prompt the user for the following information:
# the prefix to use
# the number of clients to generate
# the bottom number in the range of {num}
# the filename to use for this scripts output



generate_file() {
    local prefix="$1"
    local count="$2"
    local start="$3"
    local filename="vpn_builder.client"

    > "$filename" # Clear the file before populating

    for (( i=0; i<count; i++ )); do
        local num=$((start + i))
        printf "%s\n" "1" "${prefix}${num}" "1" "" >> "$filename"
    done
}

main() {
    read -rp "Enter prefix: " prefix
    read -rp "Enter the number of clients to generate: " count
    read -rp "Enter the bottom number in the range: " start

    generate_file "$prefix" "$count" "$start"
    echo "4" >> vpn_builder.client

    if ! ./vpn-user-build.sh < vpn_builder.client; then
        printf "%s\n" "Error: Failed to execute vpn-user-build.sh" >&2
        return 1
    fi
}

main
