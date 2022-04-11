// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Struct{
    //declaration
    struct EMP{
        string name;
        uint age;
        address acc;
    }

   EMP public emp;
   
//array of structure
   EMP[] public emparr;


    function setValues() public view{       
EMP memory emp1=EMP("nishant",20,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
//2nd way
EMP memory emp2=EMP({age:25, name:"ajay",acc:msg.sender});

//3rd way //3rd way we can not use atv contract level
EMP memory emp3;
    emp3.name="aman";
    emp3.age=10;
    emp3.acc=0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678;
    }

}