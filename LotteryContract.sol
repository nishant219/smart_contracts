// SPDX-License-Identifier: MIT

//Lottery samart contract: manager and players(array)

pragma solidity ^0.8;

contract Lottery{

    address public manager;
    address payable[] public players;

    constructor(){
        manager=msg.sender;
    }
    function alredyEntered() view private returns(bool){
        for(uint i=0;i<players.length;i++){
            if(players[i]==msg.sender){
                return true;
            }
        }
         return false;
    }

    function enter() payable public{
        require(msg.sender!=manager, "Manager can not enter into contest");
        require(alredyEntered()==false, "player alredy entered in the lottery");
        require(msg.value>= 1 ether, "Minimum amount must be paid to enter is 1 ether");
        //now player satisfies the condition so he/she can enter in lottery
        players.push(payable(msg.sender));
    }

   //to generate random integer
    function random()view private returns(uint){
       return uint(sha256(abi.encodePacked(block.difficulty, block.number, players)));
    }

    function pickWinner() public{
        require(msg.sender==manager,"Only Manager can pick the Winner");
        uint index=random()%players.length; //winner index
        address contractAddress= address(this); //winner address
        players[index].transfer(contractAddress.balance); //to transfer eth
        players= new address payable[](0); //to reset players array to new one
    }
    
    function getPlayer() view public returns(address payable[]memory){
        return players;
    }

}