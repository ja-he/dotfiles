#!/bin/bash

echo '[WRAPPER] going to dir'
cd /home/ztf/repositories/bam-checker || exit 1

echo '[WRAPPER] activating venv'
source ./.venv/bin/activate || exit 1

echo '[WRAPPER] running main.py'
python main.py
echo '[WRAPPER] done'
