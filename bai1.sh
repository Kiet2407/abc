#!/usr/bin/env bash

student_id="$1"
csv_file="gradebook.csv"

while IFS=';' read -r id name grade || [ -n "$id" ]; do
    if [ "$id" = "$student_id" ]; then
        grade=$(echo "$grade" | tr -d '\r')

        if [ "$grade" -ge 900 ]; then
            letter="A"
        elif [ "$grade" -ge 800 ]; then
            letter="B"
        elif [ "$grade" -ge 700 ]; then
            letter="C"
        elif [ "$grade" -ge 600 ]; then
            letter="D"
        else
            letter="F"
        fi

        echo "Student ID: $id"
        echo "Name: $name"
        echo "Original grade: $grade"
        echo "Letter grade: $letter"
        echo ""
    fi
done < "$csv_file"
