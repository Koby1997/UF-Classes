.data

flush:			.asciz "\n"

stringread:		.asciz "%[^\n]%*c"
stringbuffer:	.space 256

test:			.asciz "this is used to test"
test2:			.asciz "looping"




.global main
.text


main:
		

			ldr x0, =stringread
			ldr x1, =stringbuffer
			bl scanf




			mov x19, #0			//Going to be our counter, keeps track of which character in the string we are at

loop:		
			ldr x0, =stringbuffer
			add x0, x0, x19
			ldrb w20, [x0]

			subs x21, x20, #0			//This means we have reached the end of the string, so exit
			b.eq exit

			subs x21, x20, #65			//A
			b.eq CHANGE

			subs x21, x20, #97			//a
			b.eq CHANGE

			subs x21, x20, #69			//E
			b.eq CHANGE

			subs x21, x20, #101			//e
			b.eq CHANGE

			subs x21, x20, #73			//I
			b.eq CHANGE

			subs x21, x20, #105			//i
			b.eq CHANGE

			subs x21, x20, #79			//O
			b.eq CHANGE

			subs x21, x20, #111			//o
			b.eq CHANGE

			subs x21, x20, #85			//U
			b.eq CHANGE

			subs x21, x20, #117			//u
			b.eq CHANGE


			add x19, x19, #1			//incriment


			ldr x0, =test2
			bl printf

			ldr x0, =flush
			bl printf


			b loop














			







CHANGE:		
			mov w20, #120

			ldr x0, =test
			bl printf

			ldr x0, =flush
			bl printf

			add x19, x19, #1
			b loop







exit:		
			ldr x0, =stringbuffer
			bl printf

			ldr x0, =flush
			bl printf

			mov x0, #0
			mov x8, #93
			svc #0
