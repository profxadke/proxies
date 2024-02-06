#!/bin/bash


REPO="https://github.com/monosans/proxy-list"


if [ -d "proxy-list" ]; then
  cd proxy-list
  LOCAL_HASH="$(git log | grep commit | cut -d ' ' -f 2)"
  REMOTE_HASH="$(curl -s https://api.github.com/repos/monosans/proxy-list/commits/main | grep sha | head -n 1 | cut -d '"' -f 4)"
  if [ "$LOCAL_HASH" != "$REMOTE_HASH" ]; then
    cd .. && rm -rf proxy-list
    git clone "$REPO"
  fi
  cd ..
else
  git clone "$REPO"
fi


cat proxy-list/proxies/all.txt > .proxies.txt
echo "" >> .proxies.txt
cat proxy-list/proxies_anonymous/all.txt >> .proxies.txt
sort -u .proxies.txt > proxies.txt
rm .proxies.txt
