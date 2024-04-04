FROM python:3.6-alpine3.12

WORKDIR /app
COPY . /app

RUN pip3 install -r requirements.txt

ENV MONGO=mongo_host
ENV MONGO_PORT=27017



CMD FLASK_APP=ui.py gunicorn ui:app -b 0.0.0.0
