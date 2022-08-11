FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install python3-venv python3-pip -y

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt