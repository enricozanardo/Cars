// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "./BuyToken.sol";

contract CarsContract {

    mapping(address => uint256) balances;


    ERC20 public buyToken;
    address payable carOwner;
    
    constructor() {

        buyToken = new buyToken();
        carOwner = payable(msg.sender);
        balances[carOwner] = buyToken.totalSupply();

    }

    modifier Ratio() {

        require(msg.value > 0, "The ratio between the tokens is 1:1, send more wei!");
        _;

    }

    modifier Owner() {

        require(msg.sender == carOwner, "You are not the contract owner!");
        _;

    }

    modifier notOwner() {

        require(msg.sender != carOwner, "You cannot buy as the owner!");
        _;

    }


      function carOwnerBalance(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }  


    function purchaseTokens() payable Ratio public {
        require(msg.sender != carOwner, "Since you are the owner you cannot purchase the car!");
        require(balances[carOwner] > msg.value, "You are asking for more than the available amount of tokens, sorry!");

        uint256 purchaseRequest = msg.value;
        
        address Purchaser = payable(msg.sender);
        
        
        owner.transfer(purchaseRequest); //Here we are going to send the money to the owner of the contract

        
        feedToken.transfer(Purchaser, purchaseRequest); //Here we are sending the token to the purchaser

        
        balances[carOwner] = balances[carOwner] - purchaseRequest;//Here we are updating the values of the balances
        balances[Purchaser] = purchaseRequest;
    }


    uint256 dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    


    event newCar(uint carId, string carName, uint dna);
    


    struct Car {

        string carName;
        uint dna;

    }
    
    Car[] public cars;
    
    mapping (string => address) public carToOwner;
    mapping (address => uint) ownerCarCount;

    
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }
    
    function _carCreation(string memory _carName, uint _dna) internal {
        cars.push(Car(_carName, _dna));
        uint256 id = cars.length;
        
        carToOwner[_carName] = msg.sender;
        ownerCarCount[msg.sender]++;
        
        emit newCar(id, _carName, _dna);
    }

    function createRandomCar(string memory _carName) notOwner public {
        require(ownerCarCount[msg.sender] == 0, "You have already created your first Car. To have another you must buy it!");
        
        uint randDna = _generateRandomDna(_carName);
        _carCreation(_carName, randDna);
    }


    uint256 public constant fuelPrice = 100000 wei; // The cost of 1 fuel bar is 100000 wei
    uint256 public constant tokenPrice = 100000 wei; // The cost of 1 token is 100000 wei
    uint256 private totalCost; //cost of fuel in purchasing tokens
    uint256 public fuel = 0; 
    mapping(address => uint256) fuelBalances;


    function purchaseFuelTokens(uint _amount) notOwner external payable {
        
        address fuelBuyer = payable(msg.sender);

        require(balances[fuelBuyer] >= _amount, "Unfortunately you need more tokens to buy fuel!");
        
        uint256 fuelPurchaseRequest = _amount;



        totalCost = fuelPrice * fuelPurchaseRequest; //Money being sent to the owner
        buyToken.transfer(carOwner, totalCost);
        
        fuel = fuel + fuelPurchaseRequest; //Fuel being sent to the buyer
       

        balances[carOwner] = balances[carOwner] + fuelPurchaseRequest; //Updating the values accordingly
        balances[fuelBuyer] = balances[fuelBuyer] - fuelPurchaseRequest;
        foodBalances[fuelBuyer] = fuel;
    }