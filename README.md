# Rochers NFT Collection
[![Tests](https://github.com/icyfry/nft-rochers/actions/workflows/test.yml/badge.svg)](https://github.com/icyfry/nft-rochers/actions/workflows/test.yml)

The project use [Foundry](https://github.com/foundry-rs/foundry) toolkit

## Development

### Docker

The project use a docker image to build and deploy

Create the docker image
```
docker build -t foundry-rs .
```

Run the docker container to interact with the project
```
docker run -it --rm -v $(pwd):/home/foundryuser/app -v foundry_lib:/home/foundryuser/app/lib -v /home/foundryuser/app/out -v /home/foundryuser/app/cache --user foundryuser foundry-rs bash
```

the folders `lib`, `out`, `cache` are used during the build. The `lib` folder is persisted as a volume

### Setup workspace

> To run inside docker

Install forge dependencies
```
task install
```

Create remappings
```
forge remappings > remappings.txt
```

### Commands

Build contracts
```
task contracts-build contracts-test
```

Deploy contracts
```
task contracts-deploy
```

Deploy assets png and json
```
task assets-deploy
```

Mint all collection to caller
```
task mint
```

## Resources

* https://ethereum.org/fr/developers/docs/standards/tokens/erc-721/
* https://docs.opensea.io/docs/metadata-standards
