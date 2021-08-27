SHELL := /bin/bash
IMAGE=pigeosolutions/georchestra-datadir-initializer
REV=`git rev-parse --short HEAD`
DATE=`date +%Y%m%d-%H%M`

all: pull-deps docker-build docker-push

pull-deps:
	docker pull alpine

docker-build:
	docker build -f Dockerfile-alpine -t ${IMAGE}:alpine-latest . ;\
	docker tag  ${IMAGE}:alpine-latest ${IMAGE}:alpine-${DATE}-${REV}

docker-push:
	docker push ${IMAGE}:alpine-latest ;\
	docker push ${IMAGE}:alpine-${DATE}-${REV} ;\
	echo pushed ${IMAGE}:alpine-${DATE}-${REV}
