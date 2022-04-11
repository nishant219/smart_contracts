// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

 contract sendEth{
     address payable public getether= payable (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2) ;

receive()external payable{}
function checkEther() public view returns(uint){
    return address(this).balance;
}

//send
function SEND(address payable getether)public{
    bool sent= getether.send(5000000000000000000);
    require(sent, "transction failed");
}

//transfer
function TRANSFER(address payable getether)public{
    getether.transfer(5000000000000000000);
}

//call
function CALL(address payable getether)public{
   (bool sent, bytes memory data)= getether.call{value:5000000000000000000}("");
    require(sent, "transction failed");
}



 }