![GodMode Logo](https://godmode-public-assets.s3.amazonaws.com/godmode_logo.jpg)

This is a wrapper for Ganache-CLI for the GodMode environment pointing to GodMode Ganache Core. This in turn allows you to take control of third-party contracts in a test environment and run forecasting.

For full information, check the [Ganache-CLI repo](https://github.com/trufflesuite/ganache-cli).

# Usage

Start by cloing this repository and installing dependencies

```
npm install
```

Run a local chain

```
npm run start
```

OR run a mainnet fork

```
export INFURA_PROJECT_ID=<your-infura-project-id>
npm run start-fork
```

# License

[MIT](https://tldrlegal.com/license/mit-license)
