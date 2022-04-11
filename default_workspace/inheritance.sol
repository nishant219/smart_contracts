// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract A{
    function fun1A() public pure virtual returns(string memory){
        return "I'm in contract A";
    }
    function fun2A() public pure virtual returns(string memory){
        return "I'm in contract A";
    }
}

contract B is A{
    function fun1B() public pure returns(string memory){
        return "I'm in contract B";
    }
    function fun1A() public pure override virtual returns(string memory){
        return "I'm in contract B (fun2B)";
    }
    function fun2A() public pure override virtual returns(string memory){
        return "I'm in contract which uses override and virtual at once";
    }
}

contract C is B{
    function fun2A() public pure override returns(string memory){
        return "In contract C and override B which overrides A";
    }
}

contract D is A,B{
    function fun2A() public pure override(A,B) returns(string memory){
        return "In contract D";
    }
    function fun1A() public pure override(A,B) returns(string memory){
        return "I'm in contract B (D)";
    }
}