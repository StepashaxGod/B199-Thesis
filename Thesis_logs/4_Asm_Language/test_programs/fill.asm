// fill.asm | this program runs an infinite loop that reads data from keyboard.
// When any button is pressed the program blacks out the screen entierely.
// When the button is not pressed, program clears the screen.

	@SCREEN		// addr = 16384
	D=A
	@addr
	M=D	
	
(LOOP)
	@KBD	// if kbd > 0, black screen
	D=M
	@BLACK
	D;JGT

	@addr	// if addr - 16384 < 0, then jump to LOOP
	D=M
	@16384		
	D=D-A
	@LOOP
	D;JLT			

	@addr	// set RAM[addr] = 0
	A=M
	M=0
	
	@1	// addr = addr - 1
	D=A
	@addr
	M=M-D			
	

	@LOOP
	0;JMP	
(BLACK)

	@addr	// if addr - 24576 >= 0, then jump to LOOP
        D=M
        @24576
        D=D-A
        @LOOP
        D;JGE
	
	@addr	// RAM[addr] = -1
	A=M
	M=-1

	@1	// RAM[addr + 1] 
	D=A
	@addr
	M=D+M	
			
	

	@LOOP
	0;JMP	
	
