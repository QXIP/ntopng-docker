#!/bin/bash

# start redis
sudo service redis-server start
# start ntopng
ntopng "$@"
