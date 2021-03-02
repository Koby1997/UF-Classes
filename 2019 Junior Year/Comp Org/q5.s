.data
enter: .asciz "Please input a string\n"
stringread: .asciz "%s"
strbuffer: .space 256
size: .asciz "%d\n"
ispal: .asciz "True\n"
notpal: .asciz "False\n"
frontchar: .asciz "%s\n"
backchar: .asciz "%s\n"
second: .asciz "\nokherewego\n"
space: .asciz "\n"
bug: .asciz "\nit gets here\n"



.text
.global main
main:

		ldr x0, =stringread
		ldr x1, =enter		//ask for string
		bl printf

		svc #0


		ldr x0, =stringread
		ldr x1, =strbuffer
		bl scanf			//take in string



		ldr x29, =strbuffer
		mov x14, #0			//this will be used to count the length

		bl findlength		//go to findlength, starts recursion

							//recursion is done

		ldr x0, =size
		ldr x2, =size
		//mov x14, #0			//reset counter
		bl printf			//Prints string length
		




		ldr x0, =strbuffer	//////just here for help
		bl printf

		ldr x0, =space
		bl printf












		ldr x29, =strbuffer
		mov x14, #0			//this will be used to count the length

		bl findlength		//go to findlength, starts recursion

							//recursion is done

		ldr x2, =size
		mov x14, #0			//reset counter for recursion
		add x2, x2, #0
							//x2 has last digit, x14 has front digit



		bl palindrome


















		b exit

findlength:
		mov x13, x30			//x30 is link register
		ldrb w12, [x14, x29]	//took me forever to realize to use w15 and not x15
		cbz w12, done			//if its ==0 go to done
		add x14, x14, #1		//x14++
		b findlength		

done:
		mov x1, x14			
		br x13




palindrome:
			ldr x0, =bug
			bl printf
			sub x0, x14, x2	
			ldr x0
			bl printf	
			b.gt addtostack


						
base:		//reached the middle, 
		

ldr x0, =second
bl printf



addtostack:

			sub sp, sp, #16
            str x29, [sp, #0]
            str x30, [sp, #8]

            add x29, sp, #8

            sub sp, sp, #16

            str x2, [x29, #-16]
            sub x2, x2, #1

            sub sp, sp, #16
            str x29, [sp, #0]
            str x30, [sp, #8]

            add x29, sp, #8

            sub sp, sp, #16

            str x14, [x29, #-16]
            add x14, x14, #1

            bl palindrome

recursionend:
			ldr x2, [x29, #-16]
			add sp, sp, #16

			ldr x14, [x29, #-16]
			add sp, sp, #16

			cmp x2, x14
			b.ne false




true:
		ldr x0, =ispal
		bl printf

		b exit

false:
		ldr x0, =notpal
		bl printf











		exit:       mov x0, #0
            		mov x8, #93
           			svc #0