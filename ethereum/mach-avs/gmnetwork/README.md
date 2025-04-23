# GM Network

## Notice

GM Network AVS has been deprecated. You may proceed to shut down your operator and opt-out (optional) of the AVS

## Opt-out

Opt-out script should use `.env.opt` as env file, first use:

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
NODE_ECDSA_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/ethereumt1.ecdsa.key.json
NODE_BLS_KEY_FILE_HOST=${EIGENLAYER_HOME}/operator_keys/ethereumt1.bls.key.json

# TODO: Operators need to add password to decrypt the above keys
# If your password contain space, / or $, please use single quote to 
# encapsulate your password e.g 'mypassword /$'
OPERATOR_BLS_KEY_PASSWORD=
OPERATOR_ECDSA_KEY_PASSWORD=
```

Execute the following command to opt-out of GM Network MACH AVS:

```bash
./run.sh opt-out
```