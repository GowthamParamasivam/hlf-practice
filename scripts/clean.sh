#!/usr/bin/env bash

echo "===== Cleaning the configtx ======"
BASEDIR=$(dirname "$0")
# echo "$BASEDIR"
rm -Rfv $BASEDIR/../crypto-config/*
echo "Done."



