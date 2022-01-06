// SPDX-License-Identifier: MIT
////
// Aviral Goel
// First Smart Contract w/ Factory Pattern
////


// version of solidity 
pragma solidity >=0.6.0 <0.9.0;
import "./SimpleStorage.sol";


// begin smart contract
// this contract has the power to deploy instances of SimpleStorage
contract StorageFactory {

    //array of all the deployed SimpleStorage
    SimpleStorage[] public simpleStorageArray;
    
    //functio to create a SimpleStorage instance
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        //add it to the array
        simpleStorageArray.push(simpleStorage);
    }
    
    //function to assign favorite to any instance of SimpleStorage by its index
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    //function to retrieve what is the favorite number of a SimpleStorage instance by its index
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address 
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve(); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //return simpleStorageArray[_simpleStorageIndex].retrieve(); 
    }

  
}
