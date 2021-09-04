#!/bin/sh
docker run \
    -v /workspace/congenial-guacamole:/workspace \
    gcr.io/kaniko-project/executor:latest \
    --dockerfile /workspace/Dockerfile \
    --destination hsmtkk/congenial-guacamole:latest \
    --context dir:///workspace/
