# redis Script
#...

#!/bin/sh

# Update Redis configuration in redis.conf
sed -i 's/bind 127.0.0.1 -::1/bind 0.0.0.0 -::1/g' /etc/redis/redis.conf
sed -i 's|maxmemory <bytes>|maxmemory 200mb|g' /etc/redis/redis.conf
sed -i 's|maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g' /etc/redis/redis.conf
sed -i 's|protected-mode yes|protected-mode no|g' /etc/redis/redis.conf

redis-server --protected-mode no
