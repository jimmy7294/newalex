#!/bin/bash

echo "Downloading the database folder..."
curl -L -o ktem_app_data.tar.xz https://github.com/jimmy7294/newalex/releases/download/v0.2/ktem_app_data.tar.xz

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download the database folder."
  exit 1
fi

# Create the target directory if it doesn't exist
mkdir -p ktem_app_data

echo "Extracting the database folder..."
tar -xf ktem_app_data.tar.xz -C ktem_app_data

# Check if the extraction was successful
if [ $? -ne 0 ]; then
  echo "Failed to extract the database folder."
  rm ktem_app_data.tar.xz
  exit 1
fi

echo "Cleaning up..."
rm ktem_app_data.tar.xz
echo "Done! The database folder is ready."
