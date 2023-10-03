FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	wget \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://dl.min.io/server/minio/release/linux-amd64/minio -O /usr/bin/minio && \
    chmod +x /usr/bin/minio

EXPOSE 9000

CMD ["minio", "server", "/data", "--console-address", ":9001"]