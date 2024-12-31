#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <path_to_video_file(s)>"
    exit 1
fi

# Initialize total duration in seconds
total_duration=0

# Loop through all provided video files
for video_file in "$@"; do
    if [ -f "$video_file" ]; then
        # Get the duration of the video in seconds
        duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video_file")
        # Check if duration was retrieved successfully
        if [ $? -eq 0 ]; then
            total_duration=$(echo "$total_duration + $duration" | bc)
        else
            zenity --error --text "Error: Could not retrieve duration for '$video_file'"
        fi
    else
        zenity --error --text "Error: '$video_file' is not a valid file."
    fi
done

total_hours=$(echo "$total_duration / 3600" | bc)
total_minutes=$(echo "($total_duration % 3600) / 60" | bc)
total_seconds=$(echo "$total_duration % 60" | bc)

# Format the total duration as HH:MM:SS
printf -v total_duration_hms '%02d:%02d:%02d' "$total_hours" "$total_minutes" "$total_seconds"
zenity --info --text "Total duration: $total_duration_hms"
# Copy the total duration to the clipboard
echo -n "$total_duration_hms" | xclip -selection clipboard
