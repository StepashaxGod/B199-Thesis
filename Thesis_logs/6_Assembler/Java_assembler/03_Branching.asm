// 03_Branching.asm
// Purpose: test a conditional branch.
//
// Program:
// Compare 7 and 4.
// If 7 > 4, store 1 in RAM[0].
// Otherwise, store 0.
//
// Expected:
// RAM[0] = 1

@7
D=A

@4
D=D-A

@10
D;JGT

// False path
@0
M=0

@14
0;JMP

// True path
@0
M=1

@14
0;JMP

// End
@14
0;JMP
