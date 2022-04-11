// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract NewMapping{

    struct student{
        string name;
        uint marks;
        string subject;
    }
  //mapping( key => value ) <Acess Specifier> <name>;
    mapping(address => student )public result;

    address [] public student_result;

    function adding_values()public {
        student.name="nishant";
        student.marks=100;
        student.subject="Blockchain";
    }


}