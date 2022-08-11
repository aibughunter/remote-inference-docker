FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install python3-venv python3-pip -y

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

ENV LINE_MODEL_URL https://object-store.rc.nectar.org.au/v1/AUTH_bec3bd546fd54995896239e9ff3d4c4f/AIBugHunterModels/models/line_model.onnx

ENV CWE_MODEL_URL https://object-store.rc.nectar.org.au/v1/AUTH_bec3bd546fd54995896239e9ff3d4c4f/AIBugHunterModels/models/cwe_model.onnx

ENV SEV_MODEL_URL https://object-store.rc.nectar.org.au/v1/AUTH_bec3bd546fd54995896239e9ff3d4c4f/AIBugHunterModels/models/sev_model.onnx

ADD $LINE_MODEL_URL /line_model.onnx
ADD $CWE_MODEL_URL /cwe_model.onnx
ADD $SEV_MODEL_URL /sev_model.onnx