// 05_Logic.asm
// Purpose: test one logical ALU operation.
//
// Program:
// Calculate 5 OR 2.
//
// 5 = 0101
// 2 = 0010
// Result = 0111 = 7
//
// Expected:
// RAM[0] = 7

@5
D=A

@2
D=D|A

@0
M=D

// End
@6
0;JMP
