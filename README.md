# AIBugHunter Remote Inference Python Script

Python FastAPI/Uvicorn version of AIBugHunter Remote Inference Engine
This script is used in the [AIBugHunter](https://github.com/aibughunter/aibughunter) VSCode Extension to host the on-premise inference server.

## Installation and Deployment

### Install Dependencies

- Follow the guide on the [Docker's official docs](https://docs.docker.com/get-docker/) to install Docker on your machine
- Follow [this guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) to install NVIDIA Container Toolkit to enable GPU passthrough to Docker (Linux Only)

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
sudo docker run -d --name unciabit/aibughunter:latest --gpus all --env NUM_WORKERS=2 -p 8000:8000 imageName
```

else:
```bash
sudo docker run -d --name unciabit/aibughunter:latest --env NUM_WORKERS=2 -p 8000:8000 imageName
```

#### Custom Image
If you have a CUDA compatible NVIDIA GPU:
```bash
sudo docker run -d --name customerContainerName --gpus all --env NUM_WORKERS=2 -p 8000:8000 imageName
```

else:
```bash
sudo docker run -d --name customContainerName --env NUM_WORKERS=2 -p 8000:8000 imageName
```

You can remove the `--env NUM_WORKERS=2` if you only want one worker.

After this command, the following endpoints should be reachable:

- `/api/v1/cpu/predict`
- `/api/v1/gpu/predict`
- `/api/v1/cpu/cwe`
- `/api/v1/gpu/cwe`
- `/api/v1/cpu/sev`
- `/api/v1/gpu/sev`