// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MZCoin {
    uint private _totalSupply = 10000 * 10 ** 18;
    string private _name = "MZCoin";
    string private _symbol = "MZC";
    uint private _decimals = 18;
    mapping(address => uint) private _balances;
    // transferência delegada de tokens
    mapping(address => mapping(address => uint)) private _allowances;

    //Atenção especial aqui à palavra reservada indexed nos parâmetros from e to do evento. 
    //Isso permite que mais tarde esses valores sejam usados como índices em pesquisas na blockchain.
    event Transfer(address indexed from, address indexed to, uint value);

    constructor(){
        _balances[msg.sender] = _totalSupply;
    }
        //Agora a próxima função que temos de fazer é a de transferência de fundos de uma carteira para outra, 
    //sendo que aqui sempre quem está chamando a função é quem está cedendo os seus tokens, o ‘from’.
    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(msg.sender) >= value, "Insuficient balance.");
        _balances[msg.sender] -= value;
        _balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function name() public view returns (string memory){
        return _name;
    }
    
    function symbol() public view returns (string memory){
        return _symbol;
    }
    
    function decimals() public view returns (uint8){
        return _decimals;
    }
    
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    function balanceOf(address owner) public view returns(uint){
        return _balances[owner];
    }
} 
