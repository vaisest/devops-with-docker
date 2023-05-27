FROM golang

WORKDIR /usr/src/app

COPY example-backend .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

CMD ./server