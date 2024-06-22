#!/bin/bash

set -ex

python -m pip install uv
python -m uv pip install --system --strict --compile-bytecode --no-cache \
    "numpy<2"