// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract ifElse{

    string public str="state-var_string";
   
   function fun(uint _x ) public pure returns(string memory) {
    string memory val;
if(_x>100){
val="val grfeater than 100";
}else if(_x<100){
val="val is smaller than 100";
}else{
    val="val is equal to 100";
}
return val;
   }


function turnary(uint _y)public pure returns (uint){
      return _y<10 ? 1:2;
}

function String(string memory _str)public pure returns(string memory){
 string memory name =_str;
 return name;
}


}