// 1+2+3+...+n
// RAM[1] = 1 + 2 + 3 + ... + RAM[0] 
// pseudo code
// n = R0
// i = 1
// sum = 0
// LOOP: 
//	 if i > n goto STOP
//	 sum = sum + i 
// 	 i = i + 1
//     	 goto LOOP
// STOP:
//	 R1 = sum
// BINARY 

	@R0	// n = R0
	D=M
	@n
	M=D

	@i	// i = 1
	M=1

	@sum	// sum = 0
	M=0	
(LOOP)
	@i
	D=M
	@n
	D=D-M
	@STOP	// if i - n > 0 jump to STOP
	D;JGT	
		
	@sum
	D=M	
	@i	// computes new sum
	D=D+M
	@sum	// writes new sum
	M=D

	@i	// i = i + 1	
	M=M+1

	@LOOP
	0;JMP
(STOP)
	@sum
	D=M
	@R1
	M=D	
(END)
	@END
	0;JMP	









