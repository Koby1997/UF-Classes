# subroutine.s
# Hugh Wu
# This program demonstrates the use of a subroutine/function by taking in a string
# and calculating the length of the given string
.data
	string_specifier: .asciz "%s"
	number_specifier: .asciz "%d"
	newline:	  .asciz "\n"
	buffer: .space 256

.global main

.text

main:
	# Save the input string
	ldr x0, =string_specifier
	ldr x1, =buffer
	bl scanf

	# Load the register with the necessary arguments
	# In this case our subroutine takes in the address of a string
	ldr x0, =buffer

	# Call the subroutine to find the length of the string
	bl get_length

	# Print the length of the string
	# The result is located in x0 so we need to move it over
	mov x1, x0
	ldr x0, =number_specifier
	bl printf

	# Flush the buffer
	ldr x0, =newline
	bl printf

exit:
	# Exit from the program
	mov x0, #0
	mov x8, #93
	svc #0

# Description
#  This subroutine takes in the address of a string located in register
#  x0 and calculates the length of it by counting the number of characters
#  before the null character '\0'
#
#  The result is then placed back onto register x0
get_length:
	# x1 will hold the counter of characters
	mov x1, #0

  length_loop:
	# x0 holds the address of the start of the string
	# x1 holds the counter and serves as the offset for each character
	ldrb w2, [x0, x1]

	# If the loaded character is 0 (ASCII value of the null char), then it is the end of the string
	cbz w2, loop_exit

	# Else increment the counter
	add x1, x1, #1
	b length_loop

  loop_exit:
    # Put the result onto register x0
	mov x0, x1
	
	# br x30 will take us back to the next instruction immediately after bl get_length
	br x30