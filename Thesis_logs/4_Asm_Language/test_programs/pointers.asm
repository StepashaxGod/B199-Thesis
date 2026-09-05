// Pointers, where they come to play.
// notion of arrays get lost in translation; it's just a segment in memory where we know base address and length. 
// Variables that store memory addresses, like arr and i are called pointers. 
// for (i=0; i<n; i++) { arr[i] = -1 }
// suppose arr = 100; n = 10, i = 0; 

	@100	// arr = 100	
	D=A	
	@arr
	M=D

	@10	// n = 10
	D=A
	@n
	M=D

	@i	// i = 0
	M=0	
(LOOP)	
	@n	// if i < n ; end 
	D=M
	@i
	D=D-M
	@END
	D;JEQ

	@arr	// arr[i] = -1	
	D=M
	@i
	A=D+M
	M=-1

	@i	// i = i + 1
	M=M+1

	@LOOP
	0;JMP
(END)
	@END
	0;JMP
	
// Whenever we have to access memory using a pointer, we need an instruction like A=M
// Typical pointers symantics: "set the address register to the contents of some memory register". 
	
			
	
