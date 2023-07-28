// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Assessment {
    address public owner;
    uint256 public balance;

    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner of this account");
        _;
    }

    modifier sufficientBalance(uint256 amount) {
        require(balance >= amount, "Insufficient balance");
        _;
    }

    constructor(uint256 initBalance) payable {
        owner = msg.sender;
        balance = initBalance;
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function deposit() public payable onlyOwner {
        uint256 _previousBalance = balance;
        balance += msg.value;
        assert(balance == _previousBalance + msg.value);
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _withdrawAmount) public onlyOwner sufficientBalance(_withdrawAmount) {
        uint256 _previousBalance = balance;
        balance -= _withdrawAmount;
        assert(balance == _previousBalance - _withdrawAmount);
        (bool success, ) = msg.sender.call{value: _withdrawAmount}("");
        require(success, "Withdrawal failed");
        emit Withdraw(msg.sender, _withdrawAmount);
    }

    receive() external payable {
        revert("Direct payments not allowed");
    }

    fallback() external {
        revert("Invalid function call");
    }
}
