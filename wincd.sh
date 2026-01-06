#!/usr/bin/env bash

if [ $# -lt 2 ]
then
    echo "Usage: $0 <windows_username> <path_under_user>"
    echo "Example: $0 ollie \"OneDrive/Pictures/Camera Roll\""
    exit 1
fi

windows_username="$1"
shift
relative_path="$*"

relative_path="$(echo "$relative_path" | sed 's|\\|/|g')"

windows_path="C:\\Users\\$windows_username\\$(echo "$relative_path" | sed 's|/|\\|g')"

if ! command -v wslpath >/dev/null 2>&1
then
    echo "Error: wslpath not found (WSL only)."
    exit 1
fi

converted_path="$(wslpath -a -u "$windows_path" 2>/dev/null)"

if [ -z "$converted_path" ]
then
    echo "path not found"
    exit 0
fi

if [ -e "$converted_path" ]
then
    echo "cd \"$converted_path\""

    if find "$converted_path" -maxdepth 1 -type f -executable | grep -q .
    then
        echo "This directory contains executables and CAN be added to PATH."
        echo "Temporary (current session):"
        echo "export PATH=\"\$PATH:$converted_path\""
        echo "Permanent (add to ~/.bashrc):"
        echo "echo 'export PATH=\"\$PATH:$converted_path\"' >> ~/.bashrc"

        echo "To COPY into Ubuntu home:"
        echo "cp -r \"$converted_path\" ~/"

        echo "To MOVE into Ubuntu home:"
        echo "mv \"$converted_path\" ~/"
    else
        echo "This directory does NOT contain executables and should NOT be added to PATH."
        echo "To COPY into Ubuntu home:"
        echo "cp -r \"$converted_path\" ~/"
    fi
else
    echo "path not found"
fi
