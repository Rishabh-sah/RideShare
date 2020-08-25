// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract CarShare{
    // Model a User
    struct User {
        uint id;
        string name;
        string aadharno;
        string carno;
    }
    function addUser (string memory _name, string _aadharno, string _carno) public {
		if(!users[msg.sender]){
			userCount ++;
			users[userCount] = User(userCount, _name, _aadharno,_carno);
		}
		else{
		require(
			!users[msg.sender],
			"User already Present"
		);
		}		
    }
}