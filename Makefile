
IMAGE_NAME := imfeelinglucky
CONTAINER_NAME := imfeelinglucky 
PORT := 80

.PHONY: build
build:
	@docker build -t $(IMAGE_NAME) .

.PHONY: up
up: build
	@docker run -d -p $(PORT):80 -v $(PWD)/index.html:/usr/share/nginx/html/index.html --name $(CONTAINER_NAME) $(IMAGE_NAME)
	@echo "Container is up. Access your webpage at http://localhost:$(PORT)"

.PHONY: down
down:
	@docker stop $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)
	@echo "Container is down."
