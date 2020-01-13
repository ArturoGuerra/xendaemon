FROM golang:1.8-alpine AS builder
WORKDIR /app
COPY . .
RUN apk update
RUN apk add make git
RUN make build

FROM alpine:3.7
COPY --from=builder /app/deployer /usr/local/bin/deployer
COPY --from=builder /app/bin/xenserver /usr/local/bin/xenserver
ENTRYPOINT ["/usr/local/bin/deployer"]
