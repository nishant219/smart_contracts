// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Enum1{
    
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Cancel
    }
   // Status var_of_enum ;
      Status status;

    function getStatus()public view returns(Status){
      return status;  
    }
    function setStatus( Status _status )public{
      status = _status;
    }
    function rej()public{
        status=Status.Rejected;
    }
    function reset() public {
        delete status;
    }

}


contract Enum2{
    enum week_days{
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday
    }
    week_days week;
    week_days choice;

    // Setting a default value
    week_days constant default_value 
      = week_days.sunday;
      
    // Defining a function to 
    // set value of choice
    function set_value() public {
      choice = week_days.thursday;
    }
  
    // Defining a function to 
    // return value of choice 
    function get_choice(
    ) public view returns (week_days) {
      return choice;
    }
        
    // Defining function to
    //  return default value
    function getdefaultvalue(
    ) public pure returns(week_days) {  
        return default_value;  
    }



}