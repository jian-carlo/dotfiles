#!/bin/bash

# Directory containing PDFs
PDF_DIR="/mnt/c/Users/Jian/Main/personal/documents/" # Change this to your actual PDF directory

# Check if the directory exists
if [ ! -d "$PDF_DIR" ]; then
    echo "Directory $PDF_DIR does not exist!"
    exit 1
fi

# Get the list of PDFs in the directory and extract only the file names
PDFS=$(find "$PDF_DIR" -maxdepth 1 -type f -name "*.pdf" -exec basename {} \;)

# Show the file names in fzf and capture the selected file name
SELECTED=$(echo "$PDFS" | fzf --prompt="Select PDF: " --no-preview)

# Ask the user which viewer to use
if [ -n "$SELECTED" ]; then
    echo "Choose viewer:"
    echo "1) SumatraPDF (Windows)"
    echo "2) Okular (Windows)"
    read -p "Enter choice [1 or 2]: " VIEWER_CHOICE

    WSL_PATH="$PDF_DIR/$SELECTED"
    WINDOWS_PATH=$(wslpath -w "$WSL_PATH") # Convert to Windows path

    case "$VIEWER_CHOICE" in
        1)
            "sumatrapdf.exe" "$WINDOWS_PATH"
            ;;
        2)
            "okular.exe" "$WINDOWS_PATH"
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
else
    echo "No file selected."
fi
