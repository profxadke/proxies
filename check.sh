#!/bin/bash

# Line below randomly selects a proxy and, checks if it works.
curl -vx "$(shuf -n 1 proxies.txt)" https://httpbin.org/anything
