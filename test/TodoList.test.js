const { assert } = require("chai");

const TodoList = artifacts.require('./TodoList.sol');

// accounts will be an array of all the account info in ganche.
contract('TodoList', (accounts) => {
    // Using the before hook we can get a deployed smart contract copy.
    before(async() => {
        this.todoList = await TodoList.deployed();
    })

    it('deploys successfully', async() => {
        const address = await this.todoList.address
        assert.notEqual(address, 0x0);
        assert.notEqual(address, '');
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
    })

    it('lists tasks', async () => {
        const taskCount = await this.todoList.taskCount();
        const task = await this.todoList.tasks(taskCount);
        assert.equal(task.id.toNumber(), taskCount.toNumber());
    })

    it('Creates tasks', async()=>{
        const result = await this.todoList.createTask('A New Task');
        const taskCount = await this.todoList.taskCount();
        assert.equal(taskCount, 2);
        const event = result.logs[0].args; 
        // console.log(event);
        // Storing the values of key 0 in event.
        assert.equal(event.id.toNumber(), 2);
        assert.equal(event.content, 'A New Task');
        assert.equal(event.completed, false);
    })

});