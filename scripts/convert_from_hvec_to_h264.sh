#!/bin/bash

# Iterate through all .mkv files in the current directory
for file in *.mkv; do
    if [ -e "$file" ]; then
        echo "Converting $file..."
        ffmpeg -i "$file" -c:v libx264 -crf 23 -preset medium -c:a copy "${file%.*}.mp4"
    fi
done

echo "Conversion complete."
