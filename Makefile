#[abdeel-o]
start: dir build
build:
	cd srcs \
	&& sudo docker compose up --build -d
dir:
	mkdir -p /home/abdeel-o/data/wordPress \
	&& mkdir -p /home/abdeel-o/data/mysql
stop:
	cd srcs \
	&& sudo docker compose down
clean: stop
	sudo docker system prune -af \
	&& sudo rm -drf /home/abdeel-o/data/*
re: clean start
