FROM golang

WORKDIR /usr/src/app

COPY example-backend .

RUN go build

CMD ./server