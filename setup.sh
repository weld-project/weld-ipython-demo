#!/bin/bash

git clone -b parallel_encoder https://github.com/deepakn94/weld
cd weld
export WELD_HOME=`pwd`
cargo build
cargo build --release
cd python
sudo python setup.py develop

# Download data.
cd $WELD_HOME/examples/python/grizzly
mkdir -p data
wget https://raw.githubusercontent.com/jvns/pandas-cookbook/master/data/311-service-requests.csv
mv 311-service-requests.csv data/311-service-requests-raw.csv
scripts/prune-csv -i data/311-service-requests-raw.csv -l "Incident Zip"
scripts/replicate-csv -i data/311-service-requests-raw-pruned.csv -o data/311-service-requests.csv -r 30
mv data $WELD_HOME/..
