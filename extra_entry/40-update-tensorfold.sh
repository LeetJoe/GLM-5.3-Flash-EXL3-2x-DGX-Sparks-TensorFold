#!/bin/bash

DST=/usr/local/lib/python3.12/dist-packages/tensorfold
_OLD_PWD=$PWD
cd /root/.cache/huggingface/TensorFold/src/tensorfold

find "$DST" -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null

tar cf - --exclude='__pycache__' --exclude='*.cu' --exclude='*.so' . | (cd "$DST" && tar xf -)
cd "$_OLD_PWD"

exec tensorfold serve "$@"
