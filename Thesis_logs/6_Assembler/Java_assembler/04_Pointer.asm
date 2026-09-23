// 04_Pointer.asm
// Purpose: test indirect memory addressing.
//
// Program:
// Store address 12 in RAM[5].
// RAM[5] therefore acts as a pointer.
// Use the pointer to store 42 in RAM[12].
//
// Expected:
// RAM[5] = 12
// RAM[12] = 42

@12
D=A

@5
M=D

@42
D=A

@5
A=M
M=D

// End
@9
0;JMP
