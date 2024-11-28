#!/bin/bash

# Define the URL to download ollama.exe from GitHub
OLLAMA_URL="https://github.com/mwaqaskhan2002/Ollama-FastAPI/releases/download/v0.4.4/ollama"

# Download ollama.exe if it doesn't exist
if [ ! -f "ollama" ]; then
  echo "Downloading ollama..."
  curl -L -o ollama $OLLAMA_URL
fi 

# Make ollama.exe executable
chmod +x ollama

# Start Ollama server
echo "Starting Ollama server..."
./ollama serve &

# Wait for Ollama server to start
sleep 5

# Pull the model
echo "Pulling model llama3.2..."
./ollama pull llama3.2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8080
