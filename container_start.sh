#!/bin/bash

# Define container name and image
CONTAINER_NAME="sanchit"
IMAGE_NAME="sanchitsehdev/sanchit"
IMAGE_TAR="/home/ranjeet/sanchit.tar"

echo "Loading Docker image from $IMAGE_TAR..."
docker load -i "$IMAGE_TAR"

# Check if a container with the same name is running
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Container $CONTAINER_NAME is already running. Stopping and removing..."
    docker stop "$CONTAINER_NAME"
    docker rm "$CONTAINER_NAME"
fi

# Run a new container
echo "Starting new container..."
docker run -itd -p 80:80 --name "$CONTAINER_NAME" "$IMAGE_NAME"

echo "Deployment complete!"
