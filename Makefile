NAME := wasm-http-server
STATIC := $(NAME)-static

HUB ?= docker.io/nacx
TAG ?= 1.0

build: $(NAME)

$(NAME):
	go build -o wasm-http-server main.go

$(STATIC):
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
		-ldflags '-s -w -extldflags "-static"' -tags "netgo" \
		-o wasm-http-server-static main.go

docker-build: $(STATIC)
	docker build --platform linux/amd64 -t $(HUB)/$(NAME):$(TAG) .

docker-push:
	docker push $(HUB)/$(NAME):$(TAG)

clean:
	rm -f $(NAME) $(STATIC)
