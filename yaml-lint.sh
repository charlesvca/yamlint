#!/bin/bash

# Check if yamllint is installed
if ! command -v yamllint &> /dev/null
then
    echo "yamllint could not be found. Please install it using 'pip install yamllint'."
    exit 1
fi

# Directory or file(s) to lint
TARGET=${1:-.}

# Find all YAML files in the specified directory or file(s)
YAML_FILES=$(find "$TARGET" -type f \( -name "*.yml" -o -name "*.yaml" \))

# If no YAML files are found, exit
if [ -z "$YAML_FILES" ]; then
    echo "No YAML files found in the specified directory or file(s)."
    exit 0
fi
