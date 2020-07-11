pragma solidity >=0.5.0;

// This contract will have all the basic todolist details
// uint is how we define a state variable. These state variables
// will be written inside the blockchain and will be permanent once the blockchain is hosted.
// This is like the class variable in cpp.
contract TodoList {
    // unsigned int
    uint public taskCount = 0;
    // the keyword public allows us to read the value of taskcount through a function.
    // Solidity will provide us a reader function for free to read the value of taskcount.
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    // The above is how we'll model the tasks of the todo list
    // We are going to store this model in the storage of the blockchain.

    mapping(uint => Task) public tasks;
    // mapping is a datastructure that is basically a dictionary of key value pairs. Datatype of key is uint and
    // datatype of value is Task. We're going to use id as key.
    // Solidity gives us a free tasks function to access the task variable.

    // Contructor will run once at deployment.
    constructor() public {
        // The following is a default task for the todo list
        createTask("This is an introduction to programming with BlockChain");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }
}