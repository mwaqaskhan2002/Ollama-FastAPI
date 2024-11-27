#!/bin/bash

# Start Ollama server in the background
echo "Starting Ollama server..."
ollama serve &

# Store the PID of the Ollama server
ollama_pid=$!

# Wait for the Ollama server to initialize
echo "Waiting for Ollama server to start..."
sleep 5
echo "Ollama server started."

# Pull the model (no check for existence)
echo "Pulling model llama3.2..."
ollama pull llama3.2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8080

# Wait for Ollama server process to finish before exiting
wait $ollama_pid
