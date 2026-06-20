import {network} from "hardhat";
import { keccak256, stringToHex } from "viem";

const {viem} = await network.create();

console.log("DESPLEGANDO CONTRATO Registro_Eventos.sol...");

const registrar_evento_activo = await viem.deployContract("Registro_Eventos");

console.log("CONTRATO Registro_Eventos.sol DESPLEGADO EN DIRECCION:", registrar_evento_activo.address);

const evento_activo = "Marlene Carrera aprueba la baja del activo con código EQP00145 solicitado por Dario Cueva";

const evento_activo_hash = keccak256(stringToHex(evento_activo));

const tx = await registrar_evento_activo.write.registrar_evento([evento_activo_hash]);

console.log("ENVIADO:", tx);

const resultado = await registrar_evento_activo.read.verificar_evento([evento_activo_hash]) as [boolean, boolean];

console.log("RESULTADO DE LA VERIFICACION:");
console.log("EXISTE", resultado[0]);
console.log("EVENTO COINCIDE", resultado[1]);

const evento = await registrar_evento_activo.read.obtener_evento([evento_activo_hash]) as [string, string, number, boolean]; 

console.log("DATOS EN BLOCKCHAIN:");
console.log("EVENTO HASH:", evento[0]);
console.log("APROBADOR:", evento[1]);
console.log("FECHA DEL EVENTO:", evento[2]);
console.log("EXISTE:", evento[3]);

