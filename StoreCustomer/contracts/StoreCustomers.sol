// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StoreCustomers {
    struct Customer {
        string name;
        uint8 age;
    }

    address private immutable owner;
    mapping(uint32 => Customer) public customers;
    uint32 public nextId = 0;
    uint32 public count = 0;

    constructor() {
        owner = msg.sender;
    }

    function getNextId() private returns (uint32) {
        return ++nextId;
    }

    function addCustomer(Customer memory customer) public {
        customers[getNextId()] = customer;
        count++;
    }

    function getCustomer(uint32 id) public view returns (Customer memory) {
        require(id > 0 && id <= nextId, "Invalid customer ID");
        return customers[id];
    }

    function getCount() public view returns (uint32) {
        return count;
    }

    function compareStrings(
        string memory a,
        string memory b
    ) private pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function editCustomer(uint32 id, Customer memory newCustomer) public {
        Customer memory oldCustomer = customers[id];

        if (bytes(oldCustomer.name).length == 0) return;

        if (
            bytes(newCustomer.name).length > 0 &&
            !compareStrings(oldCustomer.name, newCustomer.name)
        ) oldCustomer.name = newCustomer.name;

        if (newCustomer.age > 0 && oldCustomer.age != newCustomer.age)
            oldCustomer.age = newCustomer.age;

        customers[id] = oldCustomer;
    }

    function removeCustomer(uint32 id) public {
        require(msg.sender == owner, "Caller is not owner");
        Customer memory oldCustomer = customers[id];
        if (bytes(oldCustomer.name).length > 0) {
            delete customers[id];
            count--;
        }
    }
}
