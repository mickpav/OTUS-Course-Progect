FROM python:3.6-alpine3.12

WORKDIR /app
COPY . /app

RUN pip3 install -r requirements.txt

ENV MONGO=mongo_host
ENV MONGO_PORT=27017
ENV RMQ_HOST=rabbitmq
ENV RMQ_QUEUE=urls
ENV RMQ_USERNAME=guest
ENV RMQ_PASSWORD=guest
ENV CHECK_INTERVAL=30


CMD EXCLUDE_URLS='.*github.com' python -u crawler.py https://vitkhab.github.io/search_engine_test_site/
