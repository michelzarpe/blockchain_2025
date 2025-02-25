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
    bytes2 public byte2 = 0x1AF1;
    bytes3 public byte3 = 0x1AF122;
    address public endereco = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bool public ativo = true;
    int public numero = -10;

    enum Status {Ativo, Inativo}
    Status public status;

    //concateção de strings
    string public nome1 = "Lucas";
    string public nome2 = "Silva";
    string public nome3 = string(abi.encodePacked(nome1, " ", nome2));
    string public nome4 = string.concat(nome1, " ", nome2);

    //vsiibilidade de função
    // public: todos podem chamar
    // internal: somente o contrato e contratos derivados (herança) podem chamar
    // private: somente o contrato pode chamar
    // external: somente contratos externos podem chamar

    // constant e immmutable
    // constant: não altera o estado do contrato
    // immutable: não altera o estado do contrato, mas pode ser alterado no momento da criação do contrato

    string public constant nomeConstante = "Lucas";
    int public immutable saldoInicial;

    constructor(string memory _nome, int _saldo) {
        nome = _nome;
        saldoInicial = _saldo;
        status = Status.Ativo;
        //executado uma vez quando o contrato é criado
    }

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
        status = Status.Inativo;
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

    //pega saldo de um endereco
    function getSaldo(address _endereco) public view returns(uint256) {
        return _endereco.balance;
    }

    // pega saldo do contrato
    function getSaldoContrato() public view returns(uint256) {
        return address(this).balance;
    }

    // transferir saldo para outro endereco
    function transferirSaldo(address _endereco, uint256 _valor) public {
        require(saldo >= _valor, "Saldo insuficiente");
        saldo -= _valor;
        payable(_endereco).transfer(_valor);
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


// byteX = bytes1, bytes2, bytes3, bytes4, bytes5, bytes6, bytes7, bytes8, bytes9, bytes10, bytes11, bytes12, bytes13, bytes14, bytes15, bytes16, bytes17, bytes18, bytes19, bytes20, bytes21, bytes22, bytes23, bytes24, bytes25, bytes26, bytes27, bytes28, bytes29, bytes30, bytes31, bytes32
// address = 20 bytes


// unicode
// string public nome  = unicode"joão";
// cada caracter unicode ocupa 2 bytes utf-8


//address.balance = saldo do endereço
//address.transfer = transferir saldo para outro endereço
//address.send = transferir saldo para outro endereço
//address.call = chamar uma função de um contrato
//address.callcode = chamar uma função de um contrato
//address.delegatecall = chamar uma função de um contrato
//address.staticcall = chamar uma função de um contrato

//msg.sender = endereço que chamou a função
//msg.value = valor enviado para a função
//msg.data = dados enviados para a função
//msg.sig = assinatura da função
//msg.gas = gas disponivel para a função
//msg.gasprice = preço do gas
//msg.data = dados enviados para a função
//msg.sig = assinatura da função
//msg.gas = gas disponivel para a função
//msg.gasprice = preço do gas

//block.coinbase = endereço do minerador
//block.difficulty = dificuldade do bloco
//block.gaslimit = limite de gas do bloco
//block.number = numero do bloco
//block.timestamp = timestamp do bloco

//tx.origin = endereço que originou a transação
//tx.gasprice = preço do gas
//tx.origin = endereço que originou a transação
//tx.gasprice = preço do gas
// ----------------------------------------------------------

// contrato só tem endereço
// chave privada -> chave publica -> endereço
// ----------------------------------------------------------

// endereço contrato: 0x3853E041FAC154ad54fde8d015Ca9B87eE0e803f
//
// abi
/**
[
	{
		"inputs": [],
		"name": "valor",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]

 */