FROM golang:1.16 AS builder

WORKDIR /go/src/github.com/hsmtkk/congenial-guacamole

COPY go.mod /go/src/github.com/hsmtkk/congenial-guacamole/go.mod
COPY main.go /go/src/github.com/hsmtkk/congenial-guacamole/main.go

RUN go build && ls

FROM gcr.io/distroless/cc-debian10 AS runtime

COPY --from=builder /go/src/github.com/hsmtkk/congenial-guacamole/congenial-guacamole /usr/local/bin/congenial-guacamole

ENTRYPOINT ["/usr/local/bin/congenial-guacamole"]
