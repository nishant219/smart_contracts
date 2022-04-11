// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Allowance is Ownable{

    receive() payable external{

    }

    function checkBalance() public view returns(uint){
        return address(this).balance;
    }

    // address public Owner;
    // constructor(){
    //     Owner=msg.sender;
    // }

    mapping (address => uint) public allowance;

    function addAllowance(address _to, uint _amount)public onlyOwner {
//        require(Owner==msg.sender, "You are not Owner");
          allowance[_to]+= _amount;
    }

    function isOwner() internal view returns(bool){
        return owner()==msg.sender;
    }

    modifier OwnerOrAllowed(uint _amount){
        require(isOwner() || allowance[msg.sender] >= _amount, "Not allowed" );
        _;
    }

    event MoneySent(string description, address to, uint amount);


    function withdrawMoney(string memory _description, address payable _to, uint _amount) public{

        require( address(this).balance > _amount , "Not enough fund left");

        if(isOwner()==false){
            allowance[msg.sender] -=_amount;
        }
        emit MoneySent(_description,_to,_amount);
        _to.transfer(_amount);
    }

    function renounceOwnership()public override view onlyOwner(){
        revert("cant renounce ownership");
    }

}
