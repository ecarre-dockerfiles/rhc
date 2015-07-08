# Variables
# Could be override from commandline 
IMAGE_NAME = ecarre/rhc
DATA_CONTAINER = rhc-data

.PHONY: all build clean help

# By default make command, without argument, call the first target in Makefile. In this case: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "    all      to build docker image $(IMAGE_NAME) create data container $(DATA_CONTAINER)"
	@echo "    build    to build docker image $(IMAGE_NAME)"
	@echo "    clean    to remove docker image $(IMAGE_NAME)"
	@echo "    init    	to create data container, named $(DATA_CONTAINER), use to persiste configuration"

clean:
	docker rmi $(IMAGE_NAME)
	docker rm rhc-data

all: build init

build:
	docker build --rm -t $(IMAGE_NAME) .

init:
	docker create -v /root/.openshift -v /root/.ssh --name $(DATA_CONTAINER) debian:jessie /bin/true