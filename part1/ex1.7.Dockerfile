FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y curl

WORKDIR /usr/src/app
COPY ex1.7.sh .

CMD ./ex1.7.sh
