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


			//ldr x0, =numberread
			//ldr x1, [x20]
            //bl printf





            ldr x0, =numbertwo
            ldr x1, =numberbuffertwo
            bl scanf

            ldr x21, =numberbuffertwo 			//Second Number

            //ldr x0, =numbertwo
            //ldr x1, [x21]
            //bl printf





            ldr x0, =math
            ldr x1, =mathbuffer
            bl scanf

            ldr x22, =mathbuffer				//Operation


            //ldr x0, =mathbuffer
            //bl printf
            //ldr x0, =flush
            //bl printf

          



            ldrb w23, [x22, #0]			//needed for the subs instruction

           	subs w25, w23, #43			//43 is ascii value of +
			b.eq ADD

           	subs w25, w23, #45			//45 is -
           	b.eq SUB

           	subs w25, w23, #42			//42 is *
           	b.eq MUL

           	subs w25, w23, #47			//47 is /	
           	b.eq DIV			

           	//write something here that says error

           	ldr x0, =error
           	bl printf

           	ldr x0, =flush
           	bl printf





exit:       mov x0, #0
            mov x8, #93
            svc #0


ADD:

	ldrb w23, [x20, #0]			//needed for the add instruction
	ldrb w24, [x21, #0]

	add w26, w23, w24

	ldr x0, =answer
	mov x1, x26
    bl printf

	ldr x0, =flush
	bl printf



	b exit









SUB:

	ldrb w23, [x20, #0]			//needed for the add instruction
	ldrb w24, [x21, #0]

	sub w26, w23, w24

	ldr x0, =answer
	mov x1, x26
    bl printf

	ldr x0, =flush
	bl printf


	b exit





MUL:

	ldrb w23, [x20, #0]			//needed for the add instruction
	ldrb w24, [x21, #0]

	mul w26, w23, w24

	ldr x0, =answer
	mov x1, x26
    bl printf

	ldr x0, =flush
	bl printf



	b exit





DIV:

	ldrb w23, [x20, #0]			//needed for the add instruction
	ldrb w24, [x21, #0]

	subs w27, w24, #0			//0 is ascii value of 0
	b.eq zero

	sdiv w26, w23, w24

	ldr x0, =answer
	mov x1, x26
    bl printf

	ldr x0, =flush
	bl printf




	b exit



zero:
	ldr x0, =error_two
	bl printf

	ldr x0, =flush
	bl printf

	b exit
