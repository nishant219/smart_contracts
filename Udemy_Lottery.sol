// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Lottery{
    address public manager;
    address payable []  public players;

    constructor() {
        manager=msg.sender;
    }
    function enter() public payable{
        require(msg.value> 0.1 ether, "Minimum 0.1 ether required");
        players.push(payable(msg.sender));
    }
    function random() private view returns (uint){
        //3val into hash to generate random number(difficulty,time,player)
 return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));     
    }
    function pickWinner() public restricted{
        uint index=random()%players.length;
        address winnerAddress=address(this);
        players[index].transfer(winnerAddress.balance);
        players=new address payable[](0);
    }   
    modifier restricted(){
        require(msg.sender==manager);
        _;
    }

    function getPlayer() view public returns(address payable[]memory){
        return players;
    }


}