// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

//If we want only owner can acess our fun then add that condition in modifier
contract auction{

    address public owner=msg.sender;

    modifier onlyOwner{
        require(owner == msg.sender,"You are not owner");
        _;
    }

    function start_Auction()public view{
//code
    }
    function stop_Auction() public view{
//code
    }
    function checkStatus()public view{
//code
    }
}

