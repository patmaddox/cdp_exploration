#!/usr/bin/env sh

if [ -z $1 ]; then
  >&2 echo "Usage: ./new_experiment NNN_experiment_name"
fi

mkdir $1
cp templates/experiment.sh $1/$1.sh
chmod +x $1/$1.sh
cp templates/README.experiment.md $1/README.md
