// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract crowdFunding{

    address public owner;
    mapping(address => uint) public funders;
    uint public goal;
    uint public minAmount;
    uint public noOfFunders;
    uint public fundRaised;
    uint public timePeriod;

    constructor(uint _timePeriod, uint _goal){
        goal=_goal;
        timePeriod=block.timestamp+_timePeriod;
        owner=msg.sender;
        minAmount=1000 wei;
    }
    function contributors()public payable{
        require( block.timestamp < timePeriod,"Time period was over" );
        require(msg.value > minAmount, "min amount not satisfied");  
        if(funders[msg.sender]==0){
          noOfFunders++;
        }
        funders[msg.sender]+=msg.value;
        fundRaised+=msg.value;
          }

    receive() payable external{
              contributors();
        }

    function getRefund()public{
        require(block.timestamp>timePeriod,"Funding is still ongoing");
        require(fundRaised<goal,"Funding was sucessful");
        require(funders[msg.sender]>0,"not a funder");

        payable(msg.sender).transfer{funders[msg.sender]}; //transfer money back
        fundRaised-=funders[msg.sender]; //deduct that money from funds
        funders[msg.sender]=0; //reset its denoted amount to 0
    }

    struct Requests{
        string description;
        uint amount;
        address payable receiver;
        uint noOfVoters;
        mapping(address=>bool) votes;
        bool completed;
    }    
    mapping(uint=>Request) public AllRequests;
    uint public numReq;

    function createRequest(string memory _description, uint _amount, address payable receiver) public {
       require(msg.sender==owner,"You are not the owner");
       Request storage newRequest= AllRequests[numReq];
       numReq++;
       newRequest.description= _description;
       newRequest.amount=_amount;

    }



}


 