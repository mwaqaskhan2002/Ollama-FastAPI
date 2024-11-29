#!/bin/bash

# Define the image name
OLLAMA_IMAGE="ollama/ollama:latest"

# Start the Ollama Docker container
echo "Starting Ollama Docker container..."
docker run -d --name ollama-server -p 11434:11434 $OLLAMA_IMAGE

# Wait for the Ollama server to initialize
echo "Waiting for Ollama server to be ready..."
sleep 10  # Adjust sleep duration as needed for server startup

# Pull the required model using the running container
echo "Pulling model llama3.2..."
docker exec ollama-server ollama pull llama3.2

# Start the FastAPI application
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8080