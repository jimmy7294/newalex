#!/bin/bash
echo "Downloading the database folder..."
curl -L -o ktem_app_data.zip https://github.com/jimmy7294/newalex/releases/download/v0.1/ktem_app_data.zip
echo "Extracting the database folder..."
unzip -o ktem_app_data.zip -d ktem_app_data
echo "Cleaning up..."
rm ktem_app_data.zip
echo "Done! The database folder is ready."
