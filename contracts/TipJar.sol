// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract TipJar {
    address public owner;

    event TipReceived(address indexed tipper, uint256 amount);
    event TipWithdrawn(address indexed owner, uint256 amount);

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function tip() public payable{
        require(msg.value>0);
        emit TipReceived(msg.sender, msg.value);
    }
    function withdraw() public onlyOwner{
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "There are no tips to withdraw.");

        payable(owner).transfer(contractBalance);
        emit TipWithdrawn(owner, contractBalance);
    }

    function getBalance()public view returns (uint256){
        return address(this).balance;
    }
}