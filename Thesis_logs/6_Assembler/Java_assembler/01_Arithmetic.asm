// 01_Arithmetic.asm
// Purpose: validate basic arithmetic operations and RAM writes.
//
// Expected final state:
// RAM[0] = 8
// RAM[1] = 6

@5
D=A

@3
D=D+A

@0
M=D

@2
D=D-A

@1
M=D

// End: infinite loop at instruction 10
@10
0;JMP
