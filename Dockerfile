FROM python:3.8-slim-buster

ENV \
    DISPLAY=:99 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    NVIDIA_VISIBLE_DEVICES=all

RUN apt-get -yqq update \
    && pip install pip --upgrade 

RUN apt-get update && apt-get -y install gcc g++ libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 build-essential


COPY requirement.txt /tmp/
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r /tmp/requirement.txt

WORKDIR /usr/src/app
ADD . /usr/src/app

RUN ./compile.sh