// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
	@SCREEN  //16384
    D=A
    @R0  //0
    M=D
(SETSCREEN)
    @KBD  //24576
    D=M
	@WHITE
	D;JEQ  //If no key was pressed jump to white
(BLACK)  //If key was pressed, then jump to black
	@R0  //0
	A=M
	M=-1  //Set the screen to black
	@SETLOOP
	0;JEQ  //Goto SETLOOP
(WHITE)
	@R0  //0
	A=M
	M=0  //Set the screen to white
(SETLOOP)
	@R0  //0
	M=M+1
	D=M
	@KBD  //24576
	D=D-A
	@SETSCREEN
	D;JNE
	@LOOP
	D;JEQ
	@R0  //0
	D=M
	@KBD  //24576
	D=D-A
	@SETSCREEN
	D;JNE
	@LOOP
	D;JEQ
	@LOOP
	0;JEQ  //Goto infinite loop