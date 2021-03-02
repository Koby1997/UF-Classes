.data

flush:			.asciz "\n"

numberread:		.asciz "%d"
numbertwo:		.asciz "%d"
math:			.asciz "%s"

numberbuffer:	.space 256
numberbuffertwo: .space 256
mathbuffer:		.space 256

answer:			.asciz "%d"
answerbuff:		.space 256

error:			.asciz "Error: Cannot read operation"
error_two:		.asciz "Error: Cannot divide by 0"

negative: 		.asciz "%c"


.global main
.text


main:		

			ldr x0, =numberread
            ldr x1, =numberbuffer
            bl scanf


			ldr x20, =numberbuffer 				//First number
			ldr w20, [x20]						//get actual number not the address



            ldr x0, =numbertwo
            ldr x1, =numberbuffertwo
            bl scanf

            ldr x21, =numberbuffertwo 			//Second Number
            ldr w21, [x21]



            ldr x0, =math
            ldr x1, =mathbuffer
            bl scanf

            ldr x22, =mathbuffer				//Operation

          

            //sort of an if else statement below

            ldrb w23, [x22, #0]			//needed for the subs instruction

           	subs x25, x23, #43			//43 is ascii value of +
			b.eq ADD

           	subs x25, x23, #45			//45 is -
           	b.eq SUB

           	subs x25, x23, #42			//42 is *
           	b.eq MUL

           	subs x25, x23, #47			//47 is /	
           	b.eq DIV			

           	//if reached here, unknown operation

           	ldr x0, =error
           	bl printf

           	ldr x0, =flush
           	bl printf





exit:       mov x0, #0
            mov x8, #93
            svc #0


ADD:

	add w1, w20, w21		//add and put in w1 to print

	ldr x0, =answer
	//mov x1, x26
    bl printf

	ldr x0, =flush
	bl printf


	b exit



357913941 30 /
SUB:

	sub w1, w20, w21		//subtract and put in w1 to print

	ldr x0, =answer
    bl printf

	ldr x0, =flush
	bl printf


	b exit



MUL:

	mul w1, w20, w21		//multiply the two and put in w1 to print

	ldr x0, =answer
    bl printf

	ldr x0, =flush
	bl printf



	b exit





DIV:

	subs w27, w21, #0			//0 is ascii value of 0
	b.eq zero					//if it is 0, go to error

	sdiv w1, w20, w21			//divide and put in w1 to print answer

	ldr x0, =answer
    bl printf

	ldr x0, =flush
	bl printf




	b exit



zero:
	ldr x0, =error_two		//if here, tried to divide by 0
	bl printf

	ldr x0, =flush
	bl printf

	b exit
