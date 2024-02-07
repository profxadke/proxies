#!/bin/bash

TIMEOUT=10
PROXY="$(shuf -n 1 proxies.txt)"
URL="https://httpbin.org/anything"

# Line below randomly selects a proxy and, checks if it works with a timeout of 10 sec.
timeout $TIMEOUT curl -vx "$PROXY" "$URL"

if [[ "$?" == "0" ]]; then
  echo "$PROXY" >> checked_proxies.txt
fi
