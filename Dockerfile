FROM nvidia/cuda:11.8.0-base-ubuntu22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN apt-get install python3-venv python3-pip -y

COPY remote-inference-py/ /remote-inference-py/

#WORKDIR /remote-inference-py

RUN pip install -r /remote-inference-py/requirements.txt
RUN pip install uvicorn

ENV NUM_WORKERS=1

ENV LINE_MODEL_URL https://object-store.rc.nectar.org.au/v1/AUTH_bec3bd546fd54995896239e9ff3d4c4f/AIBugHunterModels/models/line_model.onnx
ENV CWE_MODEL_URL https://object-store.rc.nectar.org.au/v1/AUTH_bec3bd546fd54995896239e9ff3d4c4f/AIBugHunterModels/models/cwe_model.onnx
ENV SEV_MODEL_URL https://object-store.rc.nectar.org.au/v1/AUTH_bec3bd546fd54995896239e9ff3d4c4f/AIBugHunterModels/models/sev_model.onnx

ADD $LINE_MODEL_URL /remote-inference-py/models/line_model.onnx
ADD $CWE_MODEL_URL /remote-inference-py/models/cwe_model.onnx
ADD $SEV_MODEL_URL /remote-inference-py/models/sev_model.onnx

# RUN cd remote-inference-py

CMD cd /remote-inference-py && uvicorn deploy:app --reload --host 0.0.0.0 --port 8000 --workers $NUM_WORKER