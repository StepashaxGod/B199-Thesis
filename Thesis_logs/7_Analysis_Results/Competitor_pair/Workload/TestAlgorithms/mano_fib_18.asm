/ Fibonacci F(18); F0=0, F1=1. Input range for this version: 2..21.
/ Direct operand addresses and ORG values below are hexadecimal.
/ Start PC=000; HLT stops execution. Result: RAM[026].
ORG 000
LDA 020
CMA
INC
STA 022
CLA
STA 023
LDA 021
STA 024
LDA 023
ADD 024
STA 025
LDA 024
STA 023
LDA 025
STA 024
ISZ 022
BUN 008
LDA 024
STA 026
HLT
ORG 020
HEX 0011 / iterations = n-1
HEX 0001 / one
HEX 0000 / negative loop counter
HEX 0000 / a
HEX 0000 / b
HEX 0000 / temp
HEX 0000 / result
END
