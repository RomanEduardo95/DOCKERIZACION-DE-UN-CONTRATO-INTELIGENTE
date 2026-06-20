// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract Registro_Eventos {
    struct Evento{
        bytes32 evento_activo_hash;
        address eqp_aprobador;
        uint256 fecha_evento;
        bool existe;
    }

    mapping (bytes32 => Evento) private evento;

    event Evento_Registrado (
        bytes32 indexed evento_activo_hash,
        address indexed eqp_aprobador
    );

    function registrar_evento(bytes32 evento_activo_hash) public {

        require(!evento[evento_activo_hash].existe,"Evento ya existente");
        
        evento[evento_activo_hash] = Evento({
             evento_activo_hash :  evento_activo_hash,
             eqp_aprobador : msg.sender,
             fecha_evento : block.timestamp,
             existe: true
        });

        emit Evento_Registrado(evento_activo_hash,msg.sender);

    }

    function verificar_evento(bytes32 evento_activo_hash) public view  returns  (bool existe, bool evento_coincide) {
        Evento memory eventos = evento[evento_activo_hash];

        existe = eventos.existe;
        evento_coincide = eventos.evento_activo_hash == evento_activo_hash;

    }

    function obtener_evento(bytes32 evento_activo_hash) public view returns (bytes32,address,uint256,bool) {

        Evento memory eventos = evento[evento_activo_hash];

        return (
            eventos.evento_activo_hash,
            eventos.eqp_aprobador,
            eventos.fecha_evento,
            eventos.existe
        );  

    }

}