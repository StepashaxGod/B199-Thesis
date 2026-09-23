// Bubble Sort ascending, shrinking bound, early exit; 8 values.
// Preload Author_bubble_data.hex into RAM; program HEX goes into ROM.
// PC=0000; STOP_ENABLE=1; STOP_ADDRESS=003F.
// Sorted result: RAM[0100..0107] (HEX). @addresses below are decimal.
// Variables: 16=bound, 17=pointer, 18=remaining, 19=swapped, 20=left, 21=right.
@7
D=A
@16
M=D
// OUTER
@16
D=M
@63
D;JEQ
@19
M=0
@256
D=A
@17
M=D
@16
D=M
@18
M=D
// INNER
@17
A=M
D=M
@20
M=D
@17
A=M
A=A+1
D=M
@21
M=D
@20
D=M
@21
D=D-M
@48
D;JLE
@21
D=M
@17
A=M
M=D
@20
D=M
@17
A=M
A=A+1
M=D
@19
M=1
// NOSWAP
@17
M=M+1
@18
M=M-1
D=M
@18
D;JGT
@19
D=M
@63
D;JEQ
@16
M=M-1
@4
0;JMP
// DONE
