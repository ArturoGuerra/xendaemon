FROM golang:1.8-alpine AS builder
COPY . .
RUN apk update
RUN apk add make
RUN make build

FROM alpine:3.7
COPY --from=builder deployer /usr/local/bin/deployer
COPY --from=builder bin/xenserver /usr/local/bin/xenserver
ENTRYPOINT ["/usr/local/bin/deployer"]
