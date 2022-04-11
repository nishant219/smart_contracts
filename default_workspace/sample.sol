// SPDX-License-Identifier: MIT

pragma solidity ^0.8;  //use compiler of 0.8 and above version 

contract ownable{
    //public simply creates getter fun ...we can read,get owner via public
    address public owner;   //type, acess modifiers, name;

constructor(){
    //msg is global variable
    owner =msg.sender;  //msg.sender provides the address of the deployer
}

//modifier checks whether fun following rules or any condition present in it
//A modifier allows you to control the behavior of your smart contract functions
modifier onlyOwner(){
    require(msg.sender == owner,"not owner");  //works like (if ,else)
    _; //if above lines code worked fine then execute the next lines
}

//each argument in fun starts with _ 
//fun will exe only when condition/code in onlyOwner is valid
function setOwner(address _newOwner) public onlyOwner{  
//fun will further exe only when require satisfies else it will print res in the console
require(_newOwner!=address(0),"Invalid Address");
owner=_newOwner;
}

function onlyOwnerCanAcess() public onlyOwner{
   //code
}

function anyOneCanAcess() public {
    //code
}



}