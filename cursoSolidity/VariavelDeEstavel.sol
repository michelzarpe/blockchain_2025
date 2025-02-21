// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract VariavelDeEstavel {

    uint256 public saldo = 1000;

    //não gera uma transação
    function pegarSaldo() public view returns(uint256) {
        return saldo;
    }

    //gera uma transação alterando o estado do contrato
    function alterarSaldo(uint256 _saldo) public {
        saldo = _saldo;
    }
}
