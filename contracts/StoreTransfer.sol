// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StoreTransfer {
    mapping(address => uint256) private balances;

    function storeValue() external payable {
        balances[msg.sender] += msg.value;
    }

    function getStoredValue() external view returns (uint256) {
        return balances[msg.sender];
    }

    function transferValue(address payable to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        to.transfer(amount);
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}