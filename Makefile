CONTAINER_NAME=centos-shell-lab
IMAGE=dokken/centos-stream-9
WORKDIR=/scripts
FILENAME=setup-test.sh
MESSAGE=Updated Project Files

start:
# using @echo to reduce clutter
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

access:
	docker exec -it $(CONTAINER_NAME) /bin/bash

set-perm:
	docker exec -it $(CONTAINER_NAME) /bin/bash -c "find . -name "*.sh" -type f -exec chmod +x {} \;"


set-local-perm:
	find . -name "*.sh" -type f -exec chmod +x {} +


run-file: set-perm
	#make set-perm
	docker exec -it $(CONTAINER_NAME) /bin/bash -c "$(WORKDIR)/scripts/$(FILENAME)"
	# make run-file FILENAME=format.sh

commit:
	git add .; git commit -m '$(MESSAGE)'; git push
	#make commmit MESSAGE='updated project files'