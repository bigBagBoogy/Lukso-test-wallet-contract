# LuksoWallet Smart Contract

## Overview

The LuksoWallet smart contract is a secure and flexible wallet designed to handle a variety of assets, including LYXt tokens and Sepolia ETH. This contract is equipped with functionalities for receiving, managing, and transferring assets with a focus on security and ease of use.

## Contract Features

### 1. Asset Reception

The LuksoWallet contract can receive and handle two types of assets:

- **LYXt Tokens:** When LYXt tokens are sent to this contract's address, it automatically processes the transfer and provides custom handling, if needed.
- **Sepolia ETH:** Similar to LYXt, the contract can receive Sepolia ETH, ensuring the correct amount is sent.

### 2. Asset Management

- **Sending Ether:** The owner of the contract can send Ether to any specified address.
- **Sending Tokens:** The owner can also send tokens (ERC-20 compatible) to any address.
- **Token Balances:** You can check the balance of specific tokens held by this contract.
- **Token Withdrawal:** The owner can withdraw tokens to their address if needed.

### 3. Security

- **Ownership Control:** The contract includes an ownership control mechanism, ensuring that only the owner can perform certain actions like sending Ether, tokens, or withdrawing tokens.
- **Fallback Function:** The contract implements a `receive` function to handle Ether and LYXt token transfers, making it secure for asset reception.

## Getting Started

To deploy and interact with this contract, you need to:

1. Deploy the contract to the Ethereum blockchain.
2. Set the owner of the contract (typically the address that deploys it).
3. Ensure you have the correct LYXt token address to handle LYXt transfers.
4. Interact with the contract using the provided functions.

## Usage

To use this contract, consider the following examples:

1. **Receiving LYXt Tokens:** Send LYXt tokens to the contract's address, and it will handle the transfer.

2. **Sending Ether:** The owner can send Ether to a specific address using the `sendEther` function.

3. **Sending Tokens:** The owner can send tokens to a specific address using the `sendTokens` function.

4. **Checking Token Balances:** Use the `getTokenBalance` function to check the balance of a specific token held by the contract.

5. **Withdrawing Tokens:** The owner can withdraw tokens to their address using the `withdrawTokens` function.

6. **Withdrawing Ether:** The owner can withdraw any Ether held by the contract using the `withdraw` function.

## Security

This contract is designed with security in mind, ensuring that asset transfers are handled correctly and securely. The ownership control mechanism prevents unauthorized actions.

## License

This smart contract is released under the MIT License.

## Contact

For any inquiries or support related to this contract, please contact the contract owner.
