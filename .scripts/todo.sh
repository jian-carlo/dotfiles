#!/usr/bin/env bash

echo ""
date +"%Y-%m-%d   %a   %I:%M %p"
echo ""

category="all"
todo_dir="$HOME/todo"
extension=".txt"
edit=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -r|--research) category="research" ;;
        -h|--hobby) category="hobby" ;;
        -s|--school) category="school" ;;
        -a|--all) category="all" ;;
        -e|--edit) edit=true ;;
        *) echo "unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

if $edit; then
    file="$todo_dir"
    if [[ "$category" = "research" || "$category" = "hobby" || "$category" = "school" ]]; then
        file="$file/$category$extension"
        nvim "$file"
    elif [ "$category" = "all" ]; then
        todos=$(find $file -type f)
        nvim $todos
    else
        echo "No todo file found for category: $category"
        exit 1
    fi
else
    total_lines=0
    temp_file=$(mktemp)
    
    if [ "$category" = "all" ]; then
        while IFS= read -r -d '' file; do
            lines=$(wc -l < "$file")
            total_lines=$((total_lines + lines))
            cat "$file" >> "$temp_file"
        done < <(find "$todo_dir" -type f -name "*$extension" -print0)
        
        sort "$temp_file" | bat -pp --language=Todo --theme=todo
    else
        file="$todo_dir/$category$extension"
        if [ -f "$file" ]; then
            sort "$file" | bat -pp --language=Todo --theme=todo
        else
            echo "No todo file found for category: $category"
            exit 1
        fi
    fi
    
    rm -f "$temp_file"  # Clean up temporary file
fi

echo ""
