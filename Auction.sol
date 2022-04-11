// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract auction{

    address payable public auctioneer;
    uint public stBlock;
    uint public edBlock;

    enum auc_state{Started, Running, Ended, Cancelled }
    auc_state public auctionState;

    uint public highestBid;
    uint public highestPayableBid;
    uint public bidInc;

    address public payable(highestBidder);

    mapping(address => uint) public bids;

    constructor(){
        auctioneer=payable(msg.sender);
        auctionState=auc_state.Running;
        stBlock=block.number;
        edBlock=stBlock+240;
        bidInc= 1 ether;
    }

   modifier notOwner{
        require(msg.sender!=auctioneer,"Auctioneer can not place bid");
        _;
    }
    modifier Owner{
        require(msg.sender==auctioneer,"Auctioneer can not bid");
        _;
    }
    modifier started{
        require(block.number>stBlock);
        _;
    }
    modifier beforeEnding{
        require(block.number<edBlock);
        _;
    }

       function min(uint a, uint b)pure private returns(uint){
           if(a>b){
               return a;
           }else{
               return b;
           }
       }
     
       function cancelAuc() public Owner{
           auctionState = auc_state.Cancelled;
        }

       function bid() payable public notOwner started beforeEnding{
          require(auctionState==auc_state.Running);   //auc must be running to bid
          require(msg.value >= 1 ether);  //min bid is 1 eth

          uint currentBid=bids[msg.sender] + msg.value;

          require(currentBid > highestPayableBid);

          bids[msg.sender]=currentBid;

          if(currentBid < bids[highestBidder]){
              highestPayableBid = min((currentBid + bidInc),(bids[highestBidder]));
          }else{
              highestPayableBid = min( ( currentBid ), (bids[highestBidder]+bidInc) );
              highestBidder=payable(msg.sender);
          }

        }

        function finilizeAuc() public{
            //either auctioneer will cancelled the auc or time limit will exceed
            require(auctionState==auc_state.Cancelled || block.number > edBlock );
            require(msg.sender==auctioneer || bids[msg.sender]>0);

            address payable person;
            uint value;

            if(auctionState==auc_state.Cancelled){
                person=payable(msg.sender);
                value=bids[msg.sender];
            }else{
                if(msg.sender==auctioneer){
                    person=auctioneer;
                    value=highestPayableBid;
                }else{
                    if(msg.sender==highestBidder){
                        person=highestBidder;
                        value=bids[highestBidder]-highestPayableBid;
                    }else{
                        person=payable(msg.sender);
                        value=bids[msg.sender];
                    }
                }
            }

        }
        
        bids[msg.sender]=0;
        person.transfer(value);


 
}