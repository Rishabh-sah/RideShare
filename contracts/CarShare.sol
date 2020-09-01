// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract CarShare{
    // Model a User
	constructor () public{

	}
    struct User {
        uint id;
        string name;
        string aadharno;
        string carno;
    }
	struct Ride{
		uint id;
		address driverid;
		string carno;
		address uid1;
		address uid2;
		address uid3;
		string source;
		string destination;
	}
	uint public userCount;
	mapping(uint => User) public users;
    function addUser (string memory _name, string memory _aadharno, string memory _carno) public {
			userCount ++;
			users[userCount] = User(userCount, _name, _aadharno,_carno);
	}
		
	uint public rideno;
	mapping(uint=> Ride) public rides;
	function start (address _id, string memory _carno, address  _uid1,
	address  _uid2, address _uid3, string memory _source, string memory _destination)
	public{
		 rideno ++;
		 rides[rideno] = Ride(rideno, _id, _carno, _uid1,_uid2, _uid3, _source, _destination);
	}
	
	function send(address _receiver) payable public {
    _receiver.call{value:msg.value,gas:20317};
    }
    
    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

}