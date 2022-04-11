// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract LOOPS{

   function loop() public pure {
//for loop
for(uint i=0;i<10;i++){
   if(i==3){
    continue;
   }
   if(i==4){
    break;
   }
}
//while loop
uint j;
while(j<10){
    j++;
}

   }


}

