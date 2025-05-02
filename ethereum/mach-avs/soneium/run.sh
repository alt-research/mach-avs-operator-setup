#!/bin/sh
# Path: run.sh

. ./.env.opt

# In all commands, We have to explicitly set the password again here because
# when docker run loads the `.env` file, it keeps the quotes around the password
# which causes the password to be incorrect.
# To test that try running `docker run --rm --env-file .env busybox /bin/sh -c 'echo $NODE_ECDSA_KEY_PASSWORD'`
# This will output password with single quote. Not sure why this happens.
optIn() {
  echo "keys: $NODE_ECDSA_KEY_FILE_HOST"
  echo "numbers: $REG_QUORUM_NUMBERS"

  qenv=""
  if [ "$REG_QUORUM_NUMBERS" != "" ]; then
    qenv="-e REG_QUORUM_NUMBERS=$REG_QUORUM_NUMBERS"
  fi
  echo "qenv: $qenv"

  docker run --env-file .env.opt $qenv \
  --rm \
  --volume "${NODE_ECDSA_KEY_FILE_HOST}":/app/operator_keys/ecdsa_key.json \
  --volume "${NODE_BLS_KEY_FILE_HOST}":/app/operator_keys/bls_key.json \
  public.ecr.aws/altlayer/mach-operator-tool:v0.3.2  \
  register-operator-with-avs
}

optOut() {
  docker run --env-file .env.opt \
    --rm \
    --volume "${NODE_ECDSA_KEY_FILE_HOST}":/app/operator_keys/ecdsa_key.json \
    --volume "${NODE_BLS_KEY_FILE_HOST}":/app/operator_keys/bls_key.json \
    public.ecr.aws/altlayer/mach-operator-tool:v0.3.2  \
    deregister-operator-with-avs
}

REG_QUORUM_NUMBERS="$2"

if [ "$1" = "opt-in" ]; then
  optIn
elif [ "$1" = "opt-out" ]; then
  optOut
else
  echo "Invalid command"
fi