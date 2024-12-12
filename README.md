# Crypto Zombie Lesson

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.ts
```

Configuration Variable (stored in $HOME/.config/hardhat-nodejs/vars.json)

```shell
npx hardhat vars list
npx hardhat vars get INFURA_API_KEY
npx hardhat vars set INFURA_API_KEY
npx hardhat vars delete INFURA_API_KEY
```

Compile, Deploy and Verify:

```shell
npx hardhat compile
npx hardhat ignition deploy ./ignition/modules/ZombieOwnership.ts --network sepolia --verify
```