FROM mongo:4.2.1

WORKDIR /work

RUN set -ex; \
	apt-get update --quiet; \
	apt-get install -y --quiet curl python; \
	rm -rf /var/lib/apt/lists/*
RUN set -ex; \
	curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-204.0.0-linux-x86_64.tar.gz; \
	tar xzvf google-cloud-sdk-204.0.0-linux-x86_64.tar.gz; \
	./google-cloud-sdk/install.sh --quiet;

ENV PATH $PATH:/work/google-cloud-sdk/bin

COPY ./backup.sh ./backup.sh

CMD ["./backup.sh"]
