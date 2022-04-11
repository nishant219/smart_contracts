// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract simpleWallet is Ownable{

    

    function withDrawMoney( address payable _to, uint _amount ) public {
        _to.transfer(_amount);
    }

    fallback() external payable {

    }


}