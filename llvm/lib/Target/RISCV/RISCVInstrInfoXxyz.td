//===-- RISCVInstrInfoXxyz.td - RISC-V 'Xxyz' instructions -*- tablegen -*-===//
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

let DecoderNamespace = "Xxyz",
    hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
class Xxyz_r<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs GPR:$rd),
              (ins GPR:$rs1, GPR:$rs2), opcodestr,
              "$rd, $rs1, $rs2"> {
}
class Xxyz_rri<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs),
              (ins GPR:$rs2, GPR:$rs1, uimm5:$rd), opcodestr,
              "$rs1, $rs2, $rd"> {
}
}

let DecoderNamespace = "Xxyz",
    hasSideEffects = 1, mayLoad = 0, mayStore = 0 in
class Xxyz_exit<bits<7> funct7, bits<3> funct3, string opcodestr>
    : RVInstR<funct7, funct3, OPC_CUSTOM_0, (outs), (ins), opcodestr, ""> {
  let rd = 0b11111;
  let rs1 = 0b11111;
  let rs2 = 0b11111;
}

let Predicates = [HasVendorXxyz, IsRV64] in {
def ABD     : Xxyz_r<0b0000000, 0b000, "abd">;
def LAUNCH     : Xxyz_rri<0b0000010, 0b000, "launch">;
def EXIT : Xxyz_exit<0b1111111, 0b111, "exit">;
} // Predicates = [HasVendorXxyz, IsRV64]

//===----------------------------------------------------------------------===//
// Pseudo-instructions and codegen patterns
//===----------------------------------------------------------------------===//

// TODO
