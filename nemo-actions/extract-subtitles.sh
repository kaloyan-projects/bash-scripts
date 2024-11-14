#!/bin/bash

# Loop through each selected file
for file in "$@"; do

    # Extract file name without extension and set output directory
    base_name=$(basename "$file" | sed 's/\.[^.]*$//')

    # Use ffprobe to find all subtitle streams
    track_count=$(ffprobe -v error -select_streams s -show_entries stream=index -of csv=p=0 "$file" | wc -l)

    # Check if subtitle tracks are found
    if [ $track_count -eq 0 ]; then
        zenity --info --text "No subtitle tracks found in $file"
        continue
    fi

    # Loop through subtitle streams and extract each one
    for ((i=0; i<$track_count; i++)); do
        output_file="$(dirname "$(readlink -f "$file")")/${base_name}_subtitle_$i.srt"
        
        # Extract the subtitle using ffmpeg
        ffmpeg -i "$file" -map 0:s:"$i" -c:s srt "$output_file"

        if [ $? -eq 0 ]; then
            zenity --info --text "Extracted subtitle track $i to $output_file"
        else
            zenity --info --text "Failed to extract subtitle track $i from $file"
        fi
    done
done