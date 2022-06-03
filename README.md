CARS SMART CONTRACT README - Clive Smith & Daniel Agius

Function 1
purchaseTokens: will send the wei to buy tokens, 1 token costs 100000 wei.

Function 2 
purchaseFuelTokens: will send buyTokens to buy fuel 1, token gives 1 fuel.

Function 3 
createRandomCar: The function will allow the user to input a car name and generate the first car, 1 user can generate 1 random car.

Function 4 
carOwnerBalance: The address will be inputted to find the value of balance in buyToken.

Function 5 
cars: Once the first car has been created, the user can input the carId. The Id must start from 0

Function 6 
carToOwner: Mapping is being used to locate and uniquely specify the car to the owner, however, the function is using the car name instead of 
the carId to do the mapping.

Function 7 
buyToken: retrieving the address of the Token.

Function 8 
fuel: Retrieves the balance of the fuel from the current address.

Function 9 
fuelPrice: Retrieves the price of fuel at the moment.

Function 10 
tokenPrice: Retrieves the current price of the token.


AA3.1 - PART A, B & C DEFINITIONS

A. DEFINE Mapping

Mapping of objects as a data structure is a very effiecient way of how to find the location of a stored object corresponding to the given key. 
Values have keys which have been hashed but can be changed to a decimal value. This unique value represents the slot in the storage where the 
object having the key value is located.

B. DEFINE STRUCTS

Structs are used in smart contracts to create a unique structure having its own datatype. A struct contains a number of variables, each having 
distinct datatypes. Usually users use structs to represent a record.

C. DEFINE MODIFIERS

Modifiers are concurred with functions implemented to set the behaviour of operation whilst being compiled in smart contracts. Modifiers will 
amend semantics of functions declaratively. Behaviour of the function can also be changed, when implementing modifiers.


KU 3.2 - PART A

A. THE DIFFERENCE BETWEEEN STORING VARIABLES ON MEMORY OR ON Storage

The difference between storing variables on memory or on starge is that on memory, the data is stored temporarily. Meaning that the data stored 
on the memory is removed once the code has been executed. Memory also has less gas consumption and is better for calculations.

On the other hand, storage stores data in between function calls. The data is accessible before and after an execution of code is made. Meaning 
that the data will not be removed. However it consumes more gas to run, than the memory.