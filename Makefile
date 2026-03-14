CONTAINER_NAME=centos-shell-lab
IMAGE=dokken/centos-stream-9
WORKDIR=/scripts
FILENAME=setup-test.sh
MESSAGE=Updated Project Files

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

access:
	docker exec -it $(CONTAINER_NAME) /bin/bash

set-perm:
	docker exec -it $(CONTAINER_NAME) /bin/bash -c "cd scripts && chmod +x *.sh"

run-file: set-perm
	#make set-perm
	docker exec -it $(CONTAINER_NAME) /bin/bash -c "$(WORKDIR)/scripts/$(FILENAME)"
	# make run-file FILENAME=format.sh

commit:
	git add .; git commit -m '$(MESSAGE)'; git push -u main
	#make commmit MESSAGE='updated project files'