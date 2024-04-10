# Build components
This doc introduces how to build all components from source code, rather then use docker.

## Architecture
For architecture, please refer to [mach-avs#architecture](https://github.com/alt-research/mach-avs/blob/m2-dev/README.md#architecture)

### BLS Signature Aggregation Mode

From the architecture, we can know that for different goals, we need the following components:

1. Run as operator
    1. mach-operator-node
    2. mach-operator-verifier

2. Run whole system in local testing
    1. mach-operator-node
    2. mach-operator-verifier
    3. mach-operator-aggregator
    4. mach-avs-contracts

### ZK Proof Mode

Comming soon

## Code Repositories
1. mach-avs: [https://github.com/alt-research/mach-avs](https://github.com/alt-research/mach-avs)

    In this repo, we have following components:

    1. mach-operator-node

    2. mach-operator-aggregator

        > Notice: `mach-operator-aggregator` will migrate to other repo soon.

    3. mach-avs-contracts

2. mach: [https://github.com/alt-research/mach](https://github.com/alt-research/mach)

    In this repo, we have following components:

    1. mach-operator-verifier

## Compile
1. `mach-avs`

    For mach-avs, the main language is `solidity` and `go`.

    For the steps to compile this repo, please lookup the doc: [mach-avs#build-and-run](https://github.com/alt-research/mach-avs/blob/m2-dev/README.md#build-and-run)

2. `mach`

    For mach, the main lanague is `rust`.

    For the steps to compile this repo, please lookup the doc: [mach#compile](https://github.com/alt-research/mach/blob/master/README.md#compile)

## Run

We list current suppoted technology stack at here:

|                                       | Opstack(Optimism) | Orbit(arbitrum) |
| :------------------------------------ | :---------------: | :-------------: |
| BLS Signature Aggregation Mode        |   supported       |   comming soon  |
| ZK Proof Mode                         |   comming soon    |   not supported |

### 1. BLS & Opstack

#### Run as Operator

For Opstack rollup, user needs to prepare the `genesis.json` file and the endpoint of this rollup.

1. `genesis.json`:

    1. If this chain is an "[op superchain](https://app.optimism.io/superchain/)", and has existed in [superchain-registry](https://github.com/ethereum-optimism/superchain-registry), you can use the latest to `op-geth` ([op-geth/releases](https://github.com/ethereum-optimism/op-geth/releases)) to get the `genesis.json` file.

        ```bash
        ./geth  dumpgenesis  --op-network=<network name, e.g. op-mainnet>  > genesis.json
        ```
    2. If this rollup is not an op superchain or can not find in [superchain-registry](https://github.com/ethereum-optimism/superchain-registry), please ask the project party for help to get this `genesis.json` file

    3. For `op-mach`, this `genesis.json` does not need to field `alloc`, thus, if the field is empty in this file is also ok.

2. endpoint of this rollup:

    1. The chain id from this endpoint must need to match the chain id in the `genesis.json`. Or in other words, this endpoint must come from this rollup.

    2. We strongly recommend that if you can run this rollup fullnode by yourself, because if the `op-mach` and the rollup fullnode can in the same network, it can reduce a lot of network delays for `op-mach` needs to fetch logs of data (stateless proof data) from this endpoint when you set `safe` or `strict` in the `config.toml` file for `op-mach`. (refer to [mach#configuration](https://github.com/alt-research/mach/blob/master/README.md#configuration))

##### Prepare

1. mach-operator-verifier: you can get `op-mach` from `mach` repo.

2. mach-operator-node: you can get `mach-operator` from `mach-avs` repo.

##### Run

1. Run `mach-operator-verifier`

    1. Prepare the `config.toml`, please refers to [mach#configuration](https://github.com/alt-research/mach/blob/master/README.md#configuration)

        Please notice the `url` must be the right endpoint of this rollup.

    2. Launch the `op-mach`

        ```bash
        ./op-mach -c <config.toml> --genesis-config <genesis.json>
        ```

2. Run `mach-operator-node`

    Please lookup the doc from: [RunOperator](https://github.com/alt-research/mach-avs/blob/m2-dev/docs/RunOperator.md)

#### Run whole system in local testing

For the setups of operatoer, is same as "Run as Operator"

But before you run the operator, you need to deploy the contract and run an aggregator before.

1. Deploy the contracts in local testing:

    [Script For Testing AVS Contracts](https://github.com/alt-research/mach-avs/blob/m2-dev/scripts/README.md)

2. Run the aggregator:

    [RunAggregator](https://github.com/alt-research/mach-avs/blob/m2-dev/docs/RunAggregator.md)

3. Run `mach-operator-verifier` is same as above

4. Run `mach-operator-node`

    Please set the corrent the aggregator endpoint and related info from `1` step.

