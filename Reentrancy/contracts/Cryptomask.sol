// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Cryptomask{

    mapping(address=> uint256) public account;

    function invest() external payable{

        account[msg.sender]+= msg.value;
    } 

    function withdraw() external{
        uint256 acc= account[msg.sender];

        require(acc>0, "account 0" );

        (bool success, )= msg.sender.call{value:acc}("");
        require(success,"Failed to fetch");

        account[msg.sender]=0;
    }









}