#!/bin/bash
set -e
DIST=/global/common/software/lcls/psana/
source $DIST/env.sh
conda activate $DIST/psana2_py37
exec $DIST/psana2_py37/bin/python -m ipykernel_launcher "$@"