import {network} from "hardhat";

const {viem} = await network.create();

console.log("DESPLEGANDO CONTRATO Registro_Eventos...");

const registrar_evento_activo = await viem.deployContract("Registro_Eventos");

console.log("CONTRATO Registro_Eventos DESPLEGADO EN DIRECCION:", registrar_evento_activo.address);
