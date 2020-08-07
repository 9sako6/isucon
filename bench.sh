#!/bin/bash

set -eu

cd ~/isubata/bench/
./bin/bench -remotes=127.0.0.1 -output=result.json
head -c 100 result.json
cd -
