UID := $(shell id -u)
GID := $(shell id -g)
DATE := $(shell date)

clean:
	rm -f $(HOME)/rust-local-registry.tar.gz

build:
	docker build --build-arg UID=$(UID) --build-arg GID=$(GID) --build-arg DATE="$(DATE)" -t offline-rust-builder .

run:
	touch $(HOME)/rust-local-registry.tar.gz
	docker run -it --rm -v $(HOME)/rust-local-registry.tar.gz:/opt/rust-local-registry.tar.gz --name offline-rust-builder offline-rust-builder
	
