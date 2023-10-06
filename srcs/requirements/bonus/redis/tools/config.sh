# redis Script
#...

#!/bin/sh

# Update Redis configuration in redis.conf
sed -i 's/bind 127.0.0.1 -::1/bind 0.0.0.0 -::1/g' /etc/redis/redis.conf
sed -i 's|maxmemory <bytes>|maxmemory 200mb|g' /etc/redis/redis.conf
# Redis will evict the least frequently used keys when it reaches its memory limit.
sed -i 's|maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g' /etc/redis/redis.conf
# Protected mode is a security feature that prevents Redis from accepting connections from users who are not authorized to access it. However, disabling protected mode is required if you want to allow remote connections.
sed -i 's|protected-mode yes|protected-mode no|g' /etc/redis/redis.conf

redis-server --protected-mode no
