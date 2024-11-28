#!/bin/bash

# Define the URL to download ollama.exe from GitHub
OLLAMA_URL="https://github.com/mwaqaskhan2002/Ollama-FastAPI/releases/download/v0.4.4/ollama.exe"

# Download ollama.exe if it doesn't exist
if [ ! -f "ollama.exe" ]; then
  echo "Downloading ollama.exe..."
  curl -L -o ollama.exe $OLLAMA_URL
fi

# Start Ollama server
echo "Starting Ollama server..."
./ollama.exe serve &

# Wait for Ollama server to start
sleep 5

# Pull the model
echo "Pulling model llama3.2..."
./ollama.exe pull llama3.2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8080
