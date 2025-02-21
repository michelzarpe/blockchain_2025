// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract VariavelDeEstavel {

    // variaveis de estado  
    // são variaveis que são armazenadas no contrato
    // são inicializadas com um valor padrão
    
    // variaveis locais 
    // são variaveis que são criadas dentro de uma função
    // não são armazenadas no contrato
    // são inicializadas com um valor padrão

    // visibilidade das variaveis
    // public: todos podem acessar
    // internal: somente o contrato e contratos derivados podem acessar
    // private: somente o contrato pode acessar

    uint256 public saldo = 1000;

    // como declarar uma string em solidity
    string public nome = "Lucas";


    //vsiibilidade de função
    // public: todos podem chamar
    // internal: somente o contrato e contratos derivados (herança) podem chamar
    // private: somente o contrato pode chamar
    // external: somente contratos externos podem chamar

    //não gera uma transação
    function pegarSaldo() public view returns(uint256) {
        return saldo;
    }

    //gera uma transação alterando o estado do contrato
    function alterarSaldo(uint256 _saldo) public {
        saldo = _saldo;
    }

    function soma(uint256 _valor) external {
        saldo += _valor;
    }

    function subtracao(uint256 _valor) private {
        saldo -= _valor;
    }

    function multiplicacao(uint256 _valor) internal {
        saldo *= _valor;
    }

    function incremento(uint256 _valor) public {
        multiplicacao(_valor);
        // mas nao pode chamar o external 
    }

    // duas forms e retornar valores em uma função, essa abaixo é uma delas
    function somaSubtracao(uint256 _valor) public view returns(uint256, uint256) {
        return (saldo + _valor, saldo - _valor);
    }

    // outra forma de retornar valores em uma função
    function somaSubtracao2(uint256 _valor) public view returns(uint256 soma, uint256 subtracao) {
        soma = saldo + _valor;
        subtracao = saldo - _valor;
    }

    // funcao pode ser pura
    function somaPura(uint256 _valor) public pure returns(uint256) {
        return 100 + _valor;
    }

    // funcao pode ser view
    function somaView() public view returns(uint256) {
        return saldo;
    }

    // set um nome
    // memory: variavel temporaria
    // storage: variavel de estado
    // calldata: variavel de chamada de dados (não pode ser alterada)
    function setNome(string memory _nome) public {
        nome = _nome;
    }    

    // get um nome
    function getNome() public view returns(string memory) {
        return nome;
    }
}


// anotações ------------------------------------------------

// 18 casas decimais
// 1 ether = 1 * 10^18 wei
// 1 ether = 1000000000000000000 wei
// 1 ether = 1e18 wei
// 1 ether = 1_000_000_000_000_000_000 wei
// 1 ether = 1_000_000_000 gwei
// 1 ether = 1_000_000 mwei

// Base deecimal 3658 = 3*10^3 + 6*10^2 + 5*10^1 + 8*10^0
// Base binaria 1011 = 1*2^3 + 0*2^2 + 1*2^1 + 1*2^0
// Base hexadecimal 0x1A = 1*16^1 + 10*16^0 = 16 + 10 = 26
// Base octal 012 = 1*8^1 + 2*8^0 = 8 + 2 = 10

// decimal =  hexadecimal = binario = octal
// 0 = 0 = 0000 = 0
// 1 = 1 = 0001 = 1
// 2 = 2 = 0010 = 2
// 3 = 3 = 0011 = 3
// 255 = FF = 11111111 = 377

// 1 bit = 0 ou 1
// 1 byte = 8 bits
// 1 kilobyte = 1024 bytes
// 1 megabyte = 1024 kilobytes
// 1 gigabyte = 1024 megabytes
// 1 terabyte = 1024 gigabytes
// 1 petabyte = 1024 terabytes
// 1 exabyte = 1024 petabytes
// 1 zettabyte = 1024 exabytes
// 1 yottabyte = 1024 zettabytes

// tipo int: int8, int16, int32, int64, int128, int256 = positivo e negativo
// tipo uint: uint8, uint16, uint32, uint64, uint128, uint256 = somente positivo
// int256/uint256 = int/uint
// int8 = -128 a 127
// uint8 = 0 a 255
// int16 = -32768 a 32767
// uint16 = 0 a 65535
// int32 = -2147483648 a 2147483647
// uint32 = 0 a 4294967295
// int64 = -9223372036854775808 a 9223372036854775807
// uint64 = 0 a 18446744073709551615
// int128 = -170141183460469231731687303715884105728 a 170141183460469231731687303715884105727
// uint128 = 0 a 340282366920938463463374607431768211455
// int256 = -57896044618658097711785492504343953926634992332820282019728792003956564819968 a 57896044618658097711785492504343953926634992332820282019728792003956564819967
// uint256 = 0 a 115792089237316195423570985008687907853269984665640564039457584007913129639935

// variavel tipo valor/valor por referencia
// valor: int, uint, bool, address, fixed, ufixed
// referencia: array, struct, mapping, string, bytes
// exemplo referencia: uint[] memory array = new uint[](10);
// ----------------------------------------------------------