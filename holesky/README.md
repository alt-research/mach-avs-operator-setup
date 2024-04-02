# Installation of Mach AVS using docker

## Prerequisites

* Docker installed
* [EigenLayer CLI](https://github.com/Layr-Labs/eigenlayer-cli) installed

> NOTE: For any Docker based commands, if you have installed as root then you might have to append `sudo` in front of the command.

## Core operations

* Register your operator to EigenLayer using [EigenLayer CLI](https://github.com/Layr-Labs/eigenlayer-cli/blob/master/README.md)

## Setup Mach AVS

The easiest way to set up Mach AVS is to clone the repo and follow the instructions below.

### Clone repo

Clone this repo and execute the following commands:

```bash
git https://github.com/alt-research/mach-avs-operator-setup.git
cd mach-avs-operator-setup/holesky/mach-avs/
cp .env.example .env
```

Update the `TODO` sections in the `.env` file given in the root directory of the repository with your own details.

```bash
###############################################################################
####### TODO: Operators please update below values for your node ##############
###############################################################################
# TODO: Node Nginx config
NODE_NGINX_CONF_HOST=../../resources/rate-limit-nginx.conf

# TODO: Operators need to point the chain config to alert
MACH_CONFIG_PATH=../../resources/chain-spec/op-demo/mach-config.toml
MACH_ALERT_CHAIN_GENESIS_PATH=../../resources/chain-spec/op-demo/genesis.json

# TODO: Operators need to update this to their own paths
USER_HOME=${HOME}
EIGENLAYER_HOME=${USER_HOME}/.eigenlayer
MACH_AVS_HOME=${EIGENLAYER_HOME}/mach-avs/holesky

NODE_LOG_PATH_HOST=${MACH_AVS_HOME}/logs
NODE_DB_PATH_HOST=${MACH_AVS_HOME}/db
NODE_CACHE_PATH_HOST=${USER_HOME}/mach-avs-operator-setup/resources/cache

# TODO: Operators need to update this to their own keys
NODE_ECDSA_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/opr.ecdsa.key.json
NODE_BLS_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/opr.bls.key.json

# TODO: Operators need to add password to decrypt the above keys
# If you have some special characters in password, make sure to use single quotes
NODE_ECDSA_KEY_PASSWORD=''
NODE_BLS_KEY_PASSWORD=''

```

### Create some local folders which are required by Mach AVS

```bash
mkdir -p $HOME/.eigenlayer/mach-avs/holesky/logs
mkdir -p $HOME/.eigenlayer/mach-avs/holesky/db
```

## Opt-in into Mach AVS

Execute the following command to opt-in Mach AVS:

```bash
./run.sh opt-in
```

You will need to specify the parameters in [.env](./.env.example) regarding:

* `NODE_QUORUM_ID_LIST`: The quorums you are going to opt-in. It's required that you haven't already registered in any of the supplied quorums in this parameter.

This command also downloads the latest SRS points (~8 GB) if they don't exist and can take upto 10 minutes to complete for the first time based on your network speed.

### Run Mach AVS

Execute the following command to start the docker containers:

```bash
docker compose up -d
```

Tear down container

```bash
docker compose down
```

### Opt-out from EigenDA

```bash
./run.sh opt-out
```

Similar to opt-in, you will need to specify the quorums you are going to opt-out via the `NODE_QUORUM_ID_LIST` in [.env](./.env.example). It's required that you have already registered in all quorums supplied in this parameter.
