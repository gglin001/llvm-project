//===-- RISCVInstrInfoXx.td - RISC-V 'Xx' instructions -----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// RISC-V specific DAG Nodes.
//===----------------------------------------------------------------------===//

// TODO

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

let DecoderNamespace = "Xx",
    hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
// class XxZ_r<bits<7> funct7, bits<3> funct3, string opcodestr>
//     : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs GPR:$rd),
//               (ins GPR:$rs1, GPR:$rs2), opcodestr,
//               "$rd, $rs1, $rs2"> {
// }
class XxZ_rri<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs),
              (ins GPR:$rs2, GPR:$rs1, uimm5:$rd), opcodestr,
              "$rs1, $rs2, $rd"> {
}
}

let Predicates = [IsRV64], DecoderNamespace = "Xx" in {
// def ABD     : XxZ_r<0b0000000, 0b000, "abd">;
def LAUNCH     : XxZ_rri<0b0000010, 0b000, "launch">;
} // Predicates = [IsRV64]

let DecoderNamespace = "Xx",
    hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
class XxZ_sp<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs GPR:$rd),
              (ins GPR:$rs1, GPR:$rs2), opcodestr, ""> {
}

let Predicates = [IsRV64], DecoderNamespace = "Xx" in {
def EXIT : XxZ_sp<0b1111111, 0b111, "exit"> {
  let rd = 0b11111;
  let rs1 = 0b11111;
  let rs2 = 0b11111;
}
} // Predicates = [IsRV64]

//===----------------------------------------------------------------------===//
// Pseudo-instructions and codegen patterns
//===----------------------------------------------------------------------===//

// TODO
