// temp = R1
// R1 = R0
// R0 = temp
// find some available memory register (say register n), and use it to 
// represent variable temp. So, each occurance of @temp in the program will// be @n. 
// variables are allocated from address 16 onwards in RAM.

	@R1 	// Get value R1
	D=M
		 
	@temp	// store R1 in temp 
	M=D

	@R0	// R1 = R0
	D=M
	@R1
	M=D

	@temp	// R0 = temp
	D=M
	@R0
	M=D		
(END)
	@END
	0;JMP
	
