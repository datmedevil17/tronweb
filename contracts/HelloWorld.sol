// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MyContract {
    string public message;
    constructor() {
        message = "Hello, World!";
    }
    function getMessage() public view returns(string memory){
        return message;
    }
}