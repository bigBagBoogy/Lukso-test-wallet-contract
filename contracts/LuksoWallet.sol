// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "contracts/ILSP1.sol";
//IERC20 lyxtToken = IERC20(lyxtTokenAddress);
// A thorough research of the LYXt token contract is needed for proper
// implementation of the receive function
// this is the LYXt token address:   0x3a74257fC1DCA6D772a141f1E2f6d0b2Fed8f24F
// this is it on block-scout: https://explorer.execution.testnet.lukso.network/address/0x3a74257fC1DCA6D772a141f1E2f6d0b2Fed8f24F
// Seems hard to obtain contract code...

contract LuksoWallet is Ownable, ERC165, ILSP1 {
    address private owner;
    bytes4 private constant _INTERFACE_ID_LSP1 = 0x6bb56a14;

    constructor() {
        _registerInterface(_INTERFACE_ID_LSP1);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    event UniversalReceiver(
        address indexed from, uint256 indexed value, bytes32 indexed typeId, bytes receivedData, bytes returnedValue
    );

    function universalReceiver(bytes32 typeId, bytes memory data) external payable override returns (bytes memory) {
        emit UniversalReceiver(msg.sender, msg.value, typeId, data, bytes("thanks"));
        return "";
    }
    // The receive function in Solidity doesn't require the function keyword. It's a special type of function introduced to handle direct transfers of Ether to a contract. Because of its special status, you don't declare it as a regular function with the function keyword.
    // When someone sends Ether directly to this contract's address, Solidity will automatically call the receive function if it's defined in your contract. This is why it's considered a "fallback" function for Ether transfers.


        receive() external payable {
    // Check if the received asset is LYXt
    address lyxtToken = 0x3a74257fC1DCA6D772a141f1E2f6d0b2Fed8f24F;
    if (msg.sender == lyxtToken) {
        // Perform the LYXt token transfer
        IERC20(lyxtToken).transferFrom(msg.sender, address(this), msg.value);
        // Your custom handling for LYXt here
    }
}

        // Check if the received asset is Sepolia ETH
        else if (msg.sender == sepoliaEthToken) {
            // Ensure the correct amount has been sent
            require(msg.value > 0, "Sepolia ETH transfers must include Ether.");

            // Your custom handling for Sepolia ETH here
        }
        // Handle other cases or reject unrecognized assets
        else {
            revert("Unsupported asset.");
        }
    }

    // Function to send Ether to a specific address
    function sendEther(address payable to, uint256 amount) public onlyOwner {
        require(address(this).balance >= amount, "Insufficient balance");
        to.transfer(amount);
    }

    // Function to send tokens to a specific address
    function sendTokens(address tokenAddress, address to, uint256 amount) public onlyOwner {
        IERC20 token = IERC20(tokenAddress);
        require(token.transfer(to, amount), "Token transfer failed");
    }

    // Function to check the balance of this wallet for a specific token
    function getTokenBalance(address tokenAddress) public view returns (uint256) {
        IERC20 token = IERC20(tokenAddress);
        return token.balanceOf(address(this));
    }

    // Function to withdraw tokens to the owner's address
    function withdrawTokens(address tokenAddress) public onlyOwner {
        IERC20 token = IERC20(tokenAddress);
        uint256 balance = token.balanceOf(address(this));
        require(token.transfer(owner, balance), "Token transfer failed");
    }

    function withdraw() public onlyOwner {
        // Allow the owner to withdraw any ETH in the contract
        payable(owner()).transfer(address(this).balance);
    }
}
