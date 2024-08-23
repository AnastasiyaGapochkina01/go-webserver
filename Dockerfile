FROM golang:1.22 AS builder
WORKDIR /go/src/app
COPY go.mod go.sum main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/web_server main.go

FROM alpine
COPY --from=builder /go/bin/web_server .
ENTRYPOINT ["/web_server"]
