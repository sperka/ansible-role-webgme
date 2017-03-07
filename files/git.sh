#!/bin/sh

if [ -z "$PKEY" ]; then
  ssh "$@" # if PKEY is not specified, run ssh using default keyfile
else
  ssh -i "$PKEY" "$@"
fi
