// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StoreCustomers {
    struct Customer {
        string name;
        uint8 age;
    }

    mapping(uint32 => Customer) public customers;

    uint32 public nextId = 0;

    uint32 public count = 0;

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
}
