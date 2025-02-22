#!/bin/bash

# Check if at least one package is provided
if [ "$#" -lt 1 ]; then

  echo "Usage: $0 package1 [package2 ... packageN]"
  exit 1
fi

# Assign positional arguments to PACKAGES
PACKAGES="$@"

# Example usage of PACKAGES
echo "Installing packages: $PACKAGES"