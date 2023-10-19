#!/bin/bash

while getopts ":s:t:tu:tw:" opt; do
    case $opt in
        s)
            source_file="$OPTARG"
            ;;
        t)
            symlink_name_generic="$OPTARG"
            ;;
        tu)
            symlink_name_unix="$OPTARG"
            ;;
        tw)
            symlink_name_windows="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Check if the required options are provided
if [ -z "$source_file" ] || ([ -z "$symlink_name_generic" ] && [ -z "$symlink_name_unix" ] && [ -z "$symlink_name_windows" ]); then
    echo "Usage: create_symlink -s source_file [-t symlink_name_generic] [-tu symlink_name_unix] [-tw symlink_name_windows]"
    exit 1
fi

if [ -n "$symlink_name_generic" ] && [ -z "$symlink_name_windows" ] && [ -z "symlink_name_unix" ]; then
    symlink_name_windows="$symlink_generic";
    symlink_name_unix="$symlink_generic";
# else
#     target_name_windows="$symlink_name_windows";
fi

# Check the operating system
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows (using PowerShell)
    powershell -Command "New-Item -ItemType SymbolicLink -Path $symlink_name_windows -Value $source_file"
    echo "Symbolic link created (Windows): $symlink_name_windows -> $source_file"
else
    # Unix-like (using Bash)
    ln -s "$source_file" "$symlink_name_unix"
    echo "Symbolic link created (Unix): $symlink_name_unix -> $source_file"
fi
