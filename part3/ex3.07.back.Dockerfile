FROM golang:alpine as build

WORKDIR /app/src
COPY example-backend .
RUN go build


FROM alpine as run

RUN addgroup app && adduser app --disabled-password --ingroup app
USER app
WORKDIR /home/app

COPY --from=build /app/src/server .

CMD ./server
