// 02_Memory.asm
// Purpose: validate RAM write, read, copy, and overwrite operations.
//
// Expected final state:
// RAM[10] = 7
// RAM[11] = 123
// RAM[12] = 7

@123
D=A

@10
M=D

@10
D=M

@11
M=D

@7
D=A

@10
M=D

@10
D=M

@12
M=D

// End: infinite loop at instruction 16
@16
0;JMP
