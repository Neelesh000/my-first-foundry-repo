//SPDX-License-Identifier:MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    uint256 public myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    Person[] public listofPeople;
    mapping(string => uint256) public nameofFavoriteNumber;

    function store(uint256 FavoriteNumber) public virtual {
        myFavoriteNumber = FavoriteNumber;
    }

    // view
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listofPeople.push(Person(_favoriteNumber, _name));
        nameofFavoriteNumber[_name] = _favoriteNumber;
    }
}
