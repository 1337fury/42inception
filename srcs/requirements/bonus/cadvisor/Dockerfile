FROM debian:bookworm

RUN apt update -y && apt install -y \
	wget \
&& rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor \
	&& chmod +x cadvisor

CMD ["./cadvisor"]