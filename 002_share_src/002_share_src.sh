#!/usr/bin/env sh

set -e

# ugly... ugly bash
project_path=$(cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
base_path=$(dirname "$project_path")

if [ ! -d "$project_path"/gen ]; then
  mkdir "$project_path"/gen
fi

if [ $(ls -A "$project_path"/gen) ]; then
  rm "$project_path"/gen/*
fi

filter fixed 1 "$base_path"/001_basics/src/babbling_brook.wav "$project_path"/gen/babbling_brook_high_pass.wav -36 1200
paplay -i "$project_path"/gen/babbling_brook_high_pass.wav
