#!/bin/bash

echo "Downloading the database folder..."
curl -L -o ktem_app_data.tar.xz https://github.com/jimmy7294/newalex/releases/download/v0.2/ktem_app_data.tar.xz

# Check if the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download the database folder."
  exit 1
fi

echo "Extracting the database folder..."
tar -xf ktem_app_data.tar.xz

# Check if the extraction was successful
if [ $? -ne 0 ]; then
  echo "Failed to extract the database folder."
  rm ktem_app_data.tar.xz
  exit 1
fi

echo "Cleaning up..."
rm ktem_app_data.tar.xz
echo "Done! The database folder is ready."
