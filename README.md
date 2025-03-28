# Onchain Racers

Onchain Racers is a blockchain-based racing game built on Solidity. Players register their racers, start races, and determine winners through smart contract logic. The game is fully decentralized, ensuring transparent and verifiable results.

## Features
- **Decentralized Racing**: All race logic runs on-chain, ensuring fairness.
- **Randomized Outcomes**: Winners are determined using a pseudo-random selection.
- **Open Participation**: Anyone can register as a racer.
- **Transparent Race Results**: All race data is stored on the blockchain.

## How It Works
1. Players register with a custom speed value.
2. Once enough players have joined, the race can be started.
3. A random winner is selected from the registered racers.
4. The race concludes, and the winner is announced.

## Smart Contract Overview
The `OnchainRacers` contract consists of the following key functions:

- `registerRacer(uint256 speed)`: Allows players to register for the race.
- `startRace()`: Starts the race once enough players have joined.
- `finishRace()`: Determines the winner randomly and resets the game.

## Deployment
To deploy the contract, use any Ethereum-compatible network:
```shell
forge create --rpc-url YOUR_RPC_URL --private-key YOUR_PRIVATE_KEY src/OnchainRacers.sol:OnchainRacers
```

## Future Enhancements
- Weighted probability based on racer speed.
- NFT-based racer upgrades.
- Multiplayer and betting mechanics.

## License
This project is licensed under the MIT License.
