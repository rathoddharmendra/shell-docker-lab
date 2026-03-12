CONTAINER_NAME=centos-shell-lab
IMAGE=dokken/centos-stream-9
WORKDIR=/scripts

start:
	@echo "Starting container..."
	docker run -dit \
	--name $(CONTAINER_NAME) \
	-v $(PWD):$(WORKDIR) \
	-w $(WORKDIR) \
	$(IMAGE) \
	sleep infinity

logs:
	docker logs $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

remove:
	docker rm $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) bash

run:
	docker exec -it $(CONTAINER_NAME) bash scripts/setup-test.sh