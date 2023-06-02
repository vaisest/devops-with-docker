FROM golang:alpine

RUN addgroup app && adduser app --disabled-password --ingroup app
USER app

WORKDIR /home/app
COPY example-backend .
RUN go build

CMD ./server