#!/bin/sh
# Path: run.sh

. ./.env.opt

optOut() {
  docker run --env-file .env.opt \
    --rm \
    --volume "${NODE_ECDSA_KEY_FILE_HOST}":/app/operator_keys/ecdsa_key.json \
    --volume "${NODE_BLS_KEY_FILE_HOST}":/app/operator_keys/bls_key.json \
    public.ecr.aws/altlayer/mach-operator-tool:v0.3.2 \
    deregister-operator-with-avs
}

if [ "$1" = "opt-out" ]; then
  optOut
else
  echo "Invalid command"
fi