// if R0 > 0 
// 	R1 = 1
// else R1 = 0
// Symbolic reference 
// @LABEL translates as @n, where n is the instruction number following
// the (LABEL) declaration.

	@R0
	D=M
	
	@POSITIVE	// using label
	D;JGT

	@R1
	M=0

	@END		// using label
	0;JMP

(POSITIVE)		// declaring label
	@R1
	M=1
(END)			// declaring label
	@END
	0;JMP
	
