TAG := ${TAG}
TAG := $(if $(TAG),$(TAG),3.7)
REPOSITORY := tomoyat1/mongo-gcs

.PHONY: docker_build
docker_build:
ifndef TAG
	$(error TAG is not set)
endif
	docker build -t $(REPOSITORY):$(TAG) ./ 
	docker push $(REPOSITORY):$(TAG)

