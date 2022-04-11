// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Modifiers{

    modifier sameCode{
        for(uint _i;_i<10;_i++){
            //code
        }
        _;
    }

    function fun1() public pure returns(string memory ){
        
        return "I'm in fun1";
    }
    
    function fun2() public pure returns(uint){
         
        return 20;
    }

    function fun3() public view returns(address){
         
        return msg.sender;
    }


}