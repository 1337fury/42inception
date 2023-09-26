#!/bin/bash

# Start redis service
service redis-server start

# Update Redis configuration
redis-cli config set bind 0.0.0.0
redis-cli config set maxmemory 200mb
redis-cli config set maxmemory-policy allkeys-lfu
redis-cli config set protected-mode no

exec "$@"
