VERSION := $(shell git describe --tags --always --dirty)

build:
	CGO_ENABLED=0 go build  -ldflags="-X 'main.Version=${VERSION}' -s -w" -o cobweb .
docker: build
	docker build . -t shynome/cobweb:${VERSION}
push: docker
	docker push shynome/cobweb:${VERSION}
