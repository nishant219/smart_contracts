// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract fallback_receive{

    event log(string _fun, address _sender, uint _val, bytes _data);

    fallback() external payable{
        emit log("fallback",msg.sender, msg.value, msg.data);
    }
    receive()external payable{
         emit log("Receive",msg.sender, msg.value, "");
    }

    function check_balance()public view returns(uint){
        return address(this).balance;
    }

}


