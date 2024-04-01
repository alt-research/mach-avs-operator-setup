#!/bin/sh
# Path: run.sh

. ./.env

socket="$NODE_HOSTNAME":"${NODE_DISPERSAL_PORT}"\;"${NODE_RETRIEVAL_PORT}"

# In all commands, We have to explicitly set the password again here because
# when docker run loads the `.env` file, it keeps the quotes around the password
# which causes the password to be incorrect.
# To test that try running `docker run --rm --env-file .env busybox /bin/sh -c 'echo $NODE_ECDSA_KEY_PASSWORD'`
# This will output password with single quote. Not sure why this happens.
optIn() {
  echo "using socket: $socket"
  echo "keys: $NODE_ECDSA_KEY_FILE_HOST"

  docker run --env-file .env \
  --rm \
  --volume "${NODE_ECDSA_KEY_FILE_HOST}":/app/operator_keys/ecdsa_key.json \
  --volume "${NODE_BLS_KEY_FILE_HOST}":/app/operator_keys/bls_key.json \
  --volume "${NODE_LOG_PATH_HOST}":/app/logs:rw \
  public.ecr.aws/altlayer/mach-operator-tool:latest \
  register-operator-with-avs
}

optOut() {
  docker run --env-file .env \
    --rm \
    --volume "${NODE_ECDSA_KEY_FILE_HOST}":/app/operator_keys/ecdsa_key.json \
    --volume "${NODE_BLS_KEY_FILE_HOST}":/app/operator_keys/bls_key.json \
    --volume "${NODE_LOG_PATH_HOST}":/app/logs:rw \
    public.ecr.aws/altlayer/mach-operator-tool:latest \
    deregister-operator-with-avs
}


if [ "$1" = "opt-in" ]; then
  optIn
elif [ "$1" = "opt-out" ]; then
  optOut
else
  echo "Invalid command"
fi