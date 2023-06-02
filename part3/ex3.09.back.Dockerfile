FROM golang:alpine as build

WORKDIR /app/src
COPY example-backend .
RUN go build

FROM scratch as run


WORKDIR /app
USER 1001:1001

COPY --from=build --chown=1001:1001 /app/src/server .

CMD ["/app/server"]

EXPOSE 8080
