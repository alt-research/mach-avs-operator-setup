# Installation of Mach AVS using docker for Xterio testnet

## Prerequisites

* Docker installed
* [EigenLayer CLI](https://github.com/Layr-Labs/eigenlayer-cli) installed


> NOTE: For any Docker based commands, if you have installed as root then you might have to append `sudo` in front of the command.

## Core operations

* Register your operator to EigenLayer using [EigenLayer CLI](https://github.com/Layr-Labs/eigenlayer-cli/blob/master/README.md)

## Setup MACH AVS

The easiest way to set up MACH AVS is to clone the repo and follow the instructions below.

### Clone repo

Clone this repo and execute the following commands:

```bash
git https://github.com/alt-research/mach-avs-operator-setup.git
cd mach-avs-operator-setup/holesky/mach-avs/xterio-testnet
cp .env.example .env
```

Update the `TODO` sections in the `.env` file given in the root directory of the repository with your own details.

```bash
###############################################################################
####### TODO: Operators please update below values for your node ##############
###############################################################################
# TODO: Set the metadata url for operator
METADATA_URI=https://path/to/metadata.json

# Operators need to update this to their own paths
USER_HOME=${HOME}
EIGENLAYER_HOME=${USER_HOME}/.eigenlayer

# TODO: Operators need to update this to their own keys
NODE_ECDSA_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/opr.ecdsa.key.json
NODE_BLS_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/opr.bls.key.json

# TODO: Operators need to add password to decrypt the above keys
# If you have some special characters in password, make sure to use single quotes
OPERATOR_ECDSA_KEY_PASSWORD=
OPERATOR_BLS_KEY_PASSWORD=
```

## Opt-in into MACH AVS

Execute the following command to opt-in MACH AVS:

```bash
./run.sh opt-in
```

### Run MACH AVS

Execute the following command to start the docker containers:

```bash
docker compose up -d
```

Tear down container

```bash
docker compose down
```

Use the default monitoring:

```bash
docker compose --profile monitoring up
```

And use this to stop:

```bash
docker compose --profile monitoring down
```

If use `monitoring` profile, will add `grafana` to monitoring the service, the default port is `13000`. can access `localhost:13000`.

### Opt-out from MACH AVS

```bash
./run.sh opt-out
```
