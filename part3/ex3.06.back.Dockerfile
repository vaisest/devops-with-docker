FROM golang:alpine as build

WORKDIR /home/app

COPY example-backend .
RUN go build && mv ./server /tmp && rm -rf * && go clean -modcache -cache && mv /tmp/server . 

RUN addgroup app && adduser app --disabled-password --ingroup app 

RUN chown -R app:app .

USER app
CMD ./server
