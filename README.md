# Rochers NFT Collection

## Development

### Project initialization

```
forge init nft-rochers --force
forge install OpenZeppelin/openzeppelin-contracts --no-commit
forge install Cyfrin/foundry-devops --no-commit
```

### Commands

Build and deploy
```
task contracts-build contracts-test contracts-deploy
```

Deploy assets png and json to `nft.icyfry.io`
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