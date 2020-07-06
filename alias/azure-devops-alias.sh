#!/bin/bash

function prCreate() {
    repo=$(basename `git rev-parse --show-toplevel`)
    source_branch=$(git rev-parse --abbrev-ref HEAD)
    echo "Title:"
    read title
    az repos pr create --title $title -r $repo --source-branch $source_branch --target-branch master --open -o none
} 