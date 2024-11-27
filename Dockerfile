FROM golang:1.23.3-bookworm

WORKDIR /goapp

COPY *.go go.mod ./

RUN go mod download
RUN GO11MODULE=on CGO_ENABLED=0 GOOS=linux go build -o /app

ENTRYPOINT [ "/goapp/app" ]
