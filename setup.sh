#!/bin/bash

echo "WELD_HOME: ${WELD_HOME?"Need to set WELD_HOME"}"

# Should be done at WELD_HOME
git clone https://github.com/weld-project/weld
cd $WELD_HOME
cargo build —-release
cd python
python setup.py develop

# Download data.
cd $WELD_HOME/examples/python/grizzly
mkdir -p data
wget https://raw.githubusercontent.com/jvns/pandas-cookbook/master/data/311-service-requests.csv
mv 311-service-requests.csv data/311-service-requests-raw.csv
scripts/prune-csv -i data/311-service-requests-raw.csv -l "Incident Zip"
scripts/replicate-csv -i data/311-service-requests-raw-pruned.csv -o data/311-service-requests.csv -r 30
mv data $WELD_HOME/..
