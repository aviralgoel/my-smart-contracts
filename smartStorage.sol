// SPDX-License-Identifier: MIT
////
// Aviral Goel
// First Smart Contract
////


// version of solidity 
pragma solidity >=0.6.0 <0.9.0;

// begin smart contract
contract SimpleStorage {

    
    uint256 favoriteNumber;

    // 
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // array of people (name, favorite number)
    People[] public people;
    
    //map data structure (key-> name, value-> favorite number)
    mapping(string => uint256) public nameToFavoriteNumber;

    //function to set the global favoriteNumber variable. (not related to People struct)
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //function to get the global favoriteNumber variable. (not related to People struct)
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    //function to add people item in our people array
    //also fill the map with people name and favorite number
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
