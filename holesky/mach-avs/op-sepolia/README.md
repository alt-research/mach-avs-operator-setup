# Installation of MACH AVS using docker for OP Sepolia testnet

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
cd mach-avs-operator-setup/holesky/mach-avs/op-sepolia
cp .env.example .env
```

Update the `TODO` sections in the `.env` file given in the root directory of the repository with your own details.

```bash
###############################################################################
####### TODO: Operators please update below values for your node ##############
###############################################################################
# TODO: Operators need to update this to their own paths
USER_HOME=${HOME}
EIGENLAYER_HOME=${USER_HOME}/.eigenlayer

# TODO: Operators need to set it ecdsa address
# can got by `eigenlayer operator keys list`, the address is in `Key Type: ECDSA`
OPERATOR_ECDSA_ADDRESS=

# TODO: Operators need to update this to their own keys
NODE_BLS_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/opr.bls.key.json

# TODO: Operators need to add password to decrypt the above keys
# If your password contain space, / or $, please use single quote to 
# encapsulate your password e.g 'mypassword /$'
OPERATOR_BLS_KEY_PASSWORD=
```

Note OPERATOR_ECDSA_ADDRESS should be an address hex like `0xad6b95793dd4d2b8e184fb4666d1cfb14871a035`.

## Opt-in into MACH AVS

Opt-in or Opt-out script should use `.env.opt` as env file, first use:

```bash
cp .env.opt-example .env.opt
```

Update the `TODO` sections in the `.env.opt` file given in the root directory of the repository with your own details.

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
# If your password contain space, / or $, please use single quote to 
# encapsulate your password e.g 'mypassword /$'
OPERATOR_BLS_KEY_PASSWORD=
OPERATOR_ECDSA_KEY_PASSWORD=
```

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
