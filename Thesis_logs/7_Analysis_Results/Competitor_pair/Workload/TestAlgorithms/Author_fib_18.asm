// Fibonacci F(18); F0=0, F1=1. Inputs supported: 1..21.
// RAM: 16=a, 17=b, 18=temp, 19=remaining, 20=result.
// Set PC=0000, STOP_ENABLE=1, STOP_ADDRESS=0022 (HEX).
// Numeric addresses only: compatible with an assembler without labels.
@16
M=0
@17
M=1
@17
D=A
@19
M=D
// LOOP
@19
D=M
@30
D;JEQ
@16
D=M
@17
D=D+M
@18
M=D
@17
D=M
@16
M=D
@18
D=M
@17
M=D
@19
M=M-1
@8
0;JMP
// END
@17
D=M
@20
M=D
