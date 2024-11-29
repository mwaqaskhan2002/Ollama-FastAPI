#!/bin/bash

# Unzip ollama.zip
echo "Unzipping ollama.zip..."
unzip -o ollama.zip

# Make ollama.exe executable
echo "Making ollama.exe executable..."
chmod +x ollama.exe

# Start the Ollama server
echo "Starting Ollama server..."
./ollama.exe serve &

# Pull the model
echo "Pulling model llama3.2..."
./ollama.exe pull llama3.2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8080