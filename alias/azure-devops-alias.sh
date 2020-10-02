#!/bin/bash

function prCreate() {
    repo=$(basename `git rev-parse --show-toplevel`)
    source_branch=$(git rev-parse --abbrev-ref HEAD)
    echo "Title:"
    read title
    az repos pr create --title $title -r $repo --source-branch $source_branch --target-branch master --open -o none
}

function azaccountset() {
    echo "Select the account:"
    account=$(az account list -o table --query '[].name' | fzf --height 30% --layout reverse)
    az account set -s $account
    az account show
}