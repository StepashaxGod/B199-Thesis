// Mult.asm | multiplication R2 = R0 * R1 , where R1 >= 0, R0 >= 0, R1 * R0 <= 32 768
// R0 and R1 are user inputs.
// pseudo code: 
// for (i=0; i<n; i++) { R2 = R0 + R0 }
// R0 happens R1 times
	
	@R1	// n = R1
	D=M
	@n
	M=D	
	
	@i	// i = 0
	M=0	
(LOOP)
	@i	// i < n
	D=M
	@n
	D=D-M
	@END
	D;JEQ

	@R0 	// R2 = R0 + R2
	D=M
	@R2
	M=D+M
	
	@i
	M=M+1	

	@LOOP
	0;JMP
(END)
	@END
	0;JMP		
	
		
