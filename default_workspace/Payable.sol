// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Payable{

    address payable public owner=payable(msg.sender); //payable address

    function getEth() payable public {
//payable funtion
    }
    
    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

}