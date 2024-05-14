// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoWallet {
    mapping(address => uint) public balances; // Store users' crypto balances

    event Transfer(address indexed from, address indexed to, uint value); // Event for crypto transfers

    constructor() {
        balances[msg.sender] = 1000; // Starter balance for the creator of the contract
    }

    // Send crypto to another user
    function sendCrypto(address _to, uint _amount) external {
        require(_to != address(0), "Invalid recipient address"); // Ensure recipient address is valid
        require(_amount > 0, "Amount must be greater than 0"); // Ensure amount is greater than 0
        require(balances[msg.sender] >= _amount, "Insufficient balance"); // Ensure sender has enough crypto

        balances[msg.sender] -= _amount; // Subtract crypto from sender's balance
        balances[_to] += _amount; // Add crypto to recipient's balance

        emit Transfer(msg.sender, _to, _amount); // Emit transfer event
    }

    // Get balance of a user
    function getBalance(address _user) external view returns (uint) {
        return balances[_user]; // Return balance of the specified user
    }

    // Get balance of the caller
    function myBalance() external view returns (uint) {
        return balances[msg.sender]; // Return balance of the caller
    }

    // function using assert
    function assertExample(uint _value) external pure returns (uint) {
        assert(_value != 0); // Ensure _value is not zero
        return _value;
    }

    // function using revert
    function revertExample(uint _value) external pure returns (uint) {
        require(_value != 0, "Value must be non-zero"); // Ensure _value is not zero
        if (_value == 0) {
            revert("Value cannot be zero"); // Revert if _value is zero
        }
        return _value;
    }
}
