# Degen Gaming Token (DGT) Smart Contract

![Degen Gaming Token](https://example.com/dgt_logo.png)

## Introduction

This repository contains the Solidity smart contract code for the Degen Gaming Token (DGT) deployed on the Fuji network. DGT is an ERC-20 standard token with additional functionality to facilitate gaming rewards and in-game item redemption. Players can earn DGT as rewards, transfer them to others, and redeem them for various items in the in-game store.

## Contract Details

- **Token Name:** Degen Gaming Token
- **Token Symbol:** DGT
- **Solidity Version:** 0.8.18
- **License:** MIT

## Contract Functions

### 1. `mint(address to, uint256 amount)`

- **Description:** Mint new DGT tokens and distribute them to players as rewards.
- **Access:** Only the contract owner can call this function.
- **Parameters:**
  - `to`: The address of the recipient who will receive the minted tokens.
  - `amount`: The amount of DGT tokens to be minted and transferred to the recipient.

### 2. `transfer(address to, uint256 amount)`

- **Description:** Players can transfer their DGT tokens to others.
- **Override:** This function overrides the transfer function from the ERC20 contract.
- **Parameters:**
  - `to`: The address of the recipient who will receive the tokens.
  - `amount`: The amount of DGT tokens to be transferred.

### 3. `redeem(uint256 amount)`

- **Description:** Players can redeem their DGT tokens for items in the in-game store.
- **Parameters:**
  - `amount`: The amount of DGT tokens to be redeemed for in-game items.
- **Note:** Before calling this function, players should ensure they have a sufficient balance of DGT tokens.

### 4. `burn(uint256 amount)`

- **Description:** Anyone can burn DGT tokens they own if they are no longer needed.
- **Parameters:**
  - `amount`: The amount of DGT tokens to be burned.
- **Note:** Before calling this function, the token owner should ensure they have a sufficient balance of DGT tokens.

## Deployment and Verification

The Degen Gaming Token (DGT) smart contract has been deployed on the Fuji network. The contract code has also been verified to ensure its authenticity and transparency.

## License

This smart contract is licensed under the MIT License, allowing you to use, modify, and distribute the code as per the terms mentioned in the [LICENSE](LICENSE) file.

## Disclaimer

Please note that smart contracts are subject to risks and vulnerabilities, and the team or individuals responsible for this contract may not be liable for any potential issues or losses that may arise from its use. It is essential to review the contract code carefully and perform due diligence before interacting with it.