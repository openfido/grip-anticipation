#!/bin/bash

# nounset: undefined variable outputs error message, and forces an exit
set -u
# errexit: abort script at first error
set -e
# print command to stdout before executing it:
set -x

echo "OPENFIDO_INPUT = $OPENFIDO_INPUT"
echo "OPENFIDO_OUTPUT = $OPENFIDO_OUTPUT"

if ! ls -1 $OPENFIDO_INPUT/*.glm; then
  echo "Input .glm file not found"
  exit 1
fi

if ! ls -1 $OPENFIDO_INPUT/*.tmy3; then
  echo "Input .tmy3 file not found"
  exit 1
fi

MAIN=$PWD/run_gridlabd_main.py
cd $OPENFIDO_OUTPUT

echo "Running GridLabD"
python3 -u $MAIN  -i $(ls $OPENFIDO_INPUT/*.glm)  -o anticipation_output.json
