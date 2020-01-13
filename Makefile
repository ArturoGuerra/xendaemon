.PHONY: build
build:
	go get -d -v
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o bin/xenserver
