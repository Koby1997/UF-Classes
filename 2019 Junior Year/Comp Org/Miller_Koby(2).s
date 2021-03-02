.data

flush:			.asciz "\n"

question:		.asciz "Input a string: "	//begining question

stringread:		.asciz "%[^\n]%*c"			//used so we can read spaces too
stringbuffer:	.space 256

char:			.asciz "%c"					//used to print out characters that are not vowels

test:			.asciz "this is used to test"
test2:			.asciz "looping"

print_x:		.asciz "x"					//prints this instead of vowels



.global main
.text


main:
			ldr x0, =question			//ask for string
			bl printf

			ldr x0, =stringread			//read in the string
			ldr x1, =stringbuffer
			bl scanf


			mov x19, #0			//Going to be our counter, keeps track of which character in the string we are at


loop:		
			ldr x0, =stringbuffer
			add x0, x0, x19
			ldrb w20, [x0]				//w20 now has the character we want to compare

			subs x21, x20, #0			//This means we have reached the end of the string, so exit the loop
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

										//if reached here, it is not a vowel, print out the character
			mov w1, w20
			ldr x0, =char
			bl printf

			b loop






CHANGE:									//if here, the character is a vowel, print out "x"

			ldr x0, =print_x
			bl printf

			add x19, x19, #1			//still need to incriment
			b loop




exit:		

			ldr x0, =flush
			bl printf	

			mov x0, #0
			mov x8, #93
			svc #0
