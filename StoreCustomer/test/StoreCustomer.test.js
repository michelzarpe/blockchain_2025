const StoreCustomers = artifacts.require("StoreCustomers");

contract('StoreCustomers', function (accounts) {
    let contract;

    beforeEach(async () => {
        contract = await StoreCustomers.new();
    })


    it('Add Customer', async () => {
        await contract.addCustomer({
            name: "Zé",
            age: 33
        });

        const count = await contract.count();

        assert(count.toNumber() === 1, "Couldn't add customer")
    })

    it('Get Count', async () => {
        await contract.addCustomer({
            name: "Zé",
            age: 33
        });

        const count = await contract.getCount();

        assert(count.toNumber() === 1, "Couldn't add customer")
    })


    it('Get Customer', async () => {
        await contract.addCustomer({
            name: "Zé",
            age: 33
        });

      
        const nextId = await contract.nextId();

        console.log("Next ID: ", nextId.toNumber()); 

        const customer = await contract.getCustomer(1);

        assert.equal(customer.age.toNumber(), 33, "The customer age should be 33");

        assert.equal(customer.name, "Zé", "The customer name should be Zé");
    });

    it('Edit Customer', async () => {
        await contract.addCustomer({
            name: "Luiz",
            age: 34
        });
     
        await contract.editCustomer(1, { name: "Fernando", age: 0 });
     
        const customer = await contract.getCustomer(1);
        assert(customer.name === "Fernando" && customer.age === 34, "Couldn't edit the customer.");
    })

    it('Remove Customer', async () => {
        await contract.addCustomer({
            name: "Luiz",
            age: 34
        });
     
        await contract.removeCustomer(1, { from: accounts[0] });
        const count = await contract.count();
        assert(count.toNumber() === 0, "Couldn't delete the customer.");
    })



});