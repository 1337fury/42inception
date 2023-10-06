#[abdeel-o]
build:
	cd srcs \
	&& sudo docker compose up --build -d
dir:
	mkdir -p /home/abdeel-o/data/wordpress \
	&& mkdir -p /home/abdeel-o/data/mysql
start: dir build
stop:
	cd srcs \
	&& sudo docker compose down
clean: stop
	sudo docker system prune -af \
	&& sudo rm -drf /home/abdeel-o/data/*
re: clean start
