# AIBugHunter Remote Inference Python Script

Python FastAPI/Uvicorn version of AIBugHunter Remote Inference Engine
This script is used in the [AIBugHunter](https://github.com/aibughunter/aibughunter) VSCode Extension to host the on-premise inference server.

## Installation and Deployment

### Install Dependencies

Follow the guide on the [Docker's official docs](https://docs.docker.com/get-docker/) to install Docker on your machine

### Building the image

Run the following commands to deploy the server

#### Build Image

You can use the image in the Docker Hub so you can skip this step

1. Clone the repository

```bash
git clone https://github.com/aibughunter/remote-inference-docker
```

2. `cd` into the cloned repository

```bash
cd remote-inference-docker
```

3. Build the Dockerimage

```bash
sudo docker build -t imageName .
```

Docker will build the image with the specified name

### Deploying

#### Docker Hub
If you have a CUDA compatible NVIDIA GPU:
```bash
sudo docker run -d --name containerName --gpus all -p 8000:8000 imageName --env NUM_WORKERS=2
```

else:
```bash
sudo docker run -d --name containerName --gpus all -p 8000:8000 imageName --env NUM_WORKERS=2
```