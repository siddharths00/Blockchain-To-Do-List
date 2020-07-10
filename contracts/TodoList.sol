pragma solidity >=0.5.0;

// This contract will have all the basic todolist details
// uint is how we define a state variable. These state variables
// will be written inside the blockchain and will be permanent once the blockchain is hosted.
// This is like the class variable in cpp.
contract TodoList {
    uint public taskCount = 0;
    // the keyword public allows us to read the value of taskcount through a function.
}