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
cd mach-avs-operator-setup/holesky/mach-avs/op-sepolia
cp .env.example .env
```

Update the `TODO` sections in the `.env` file given in the root directory of the repository with your own details.

```bash
###############################################################################
####### TODO: Operators please update below values for your node ##############
###############################################################################
# TODO: Set the metadata url for operator
METADATA_URI=https://path/to/metadata.json

# TODO: Operators need to update this to their own paths
USER_HOME=${HOME}
EIGENLAYER_HOME=${USER_HOME}/.eigenlayer

# TODO: Operators need to update this to their own keys
NODE_ECDSA_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/holeskyt1.ecdsa.key.json
NODE_BLS_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/holeskyt1.bls.key.json

# TODO: Operators need to add password to decrypt the above keys
# If you have some special characters in password, make sure to use single quotes
NODE_ECDSA_KEY_PASSWORD=''
NODE_BLS_KEY_PASSWORD=''
```

## Opt-in into Mach AVS

Execute the following command to opt-in Mach AVS:

```bash
./run.sh opt-in
```

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
