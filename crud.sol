// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Crud{
    struct User{
        uint id;
        string name;
    }
    User[]public users;
    uint public nextId=1;
    
    function create(string memory name)public {
        users.push(User(nextId,name));
        nextId++;
    } 

    function read()view public returns(uint, string memory){
    uint i=find(id);
    return(users[i].id, users[i].name);
    }

    function update(uint id, string memory name) public {
        uint i = find(id);
        users[i].name = name;
    }

    function destroy(uint id) public {
    delete users[id];
    }

    function find(uint id)view internal returns(uint){
      for(uint i=0;i<users.length;i++){
          if(users[i].id==id){
             return i;
          }
      }
      revert('User does not exist!!!');
    }


}