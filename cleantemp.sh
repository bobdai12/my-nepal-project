#!bin/bash 


#!/bin/bash

echo "===== LINUX CLEANER ====="
echo "1. Clean APT cache"
echo "2. Clean Go build cache"
echo "3. Clean thumbnail cache"
echo "4. Show cache sizes"
echo "5. Exit"

read -rp "Choose an option: " choice

case "$choice" in
    1)
        sudo apt clean
        echo "APT cache cleaned."
        ;;
    2)
        if command -v go >/dev/null 2>&1; then
            go clean -cache
            echo "Go build cache cleaned."
        else
            echo "Go is not installed or not in PATH."
        fi
        ;;
    3)
        rm -rf -- "$HOME/.cache/thumbnails"/*
        echo "Thumbnail cache cleaned."
        ;;
    4)
        du -sh "$HOME/.cache" /tmp /var/tmp 2>/dev/null
        ;;
    5)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac

