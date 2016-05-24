#!/usr/bin/env sh

set -e

if [ ! -d gen ]; then
  mkdir gen
fi

if [ "$(ls -A gen)" ]; then
  rm gen/*
fi
