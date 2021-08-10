FROM golang:latest AS builder
WORKDIR /go/src/app
COPY src/helloWorld.go .
RUN go mod init helloWorld && \
    go build && \
    go install


FROM scratch
WORKDIR /tmp
COPY --from=builder /go/bin/helloWorld .
CMD ["/tmp/helloWorld"]

