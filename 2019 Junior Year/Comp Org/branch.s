# branch.s
# Hugh Wu
# This program demonstrates a branch instruction by checking the value of the input
# character and branching to a label based off of that. If the input is a number/digit,
# it will print out "DIGIT"
.data
    # Alternatively, instead of printing a single newline at the end
    # we can add the newline after the string
    digit_string:       .asciz "DIGIT\n"
    notdigit_string:    .asciz "NOT DIGIT\n"

    char_specifier:     .asciz "%c"
    input_buffer:       .space 1

.global main
.text

main:
    # Load the appropriate arguments into the registers and call scanf
    ldr x0, =char_specifier
    ldr x1, =input_buffer
    bl scanf

    # Load register x20 with the address of the input
    ldr x20, =input_buffer

    # Load a single byte (char) into the register w21
    # w21 is just the 32-bit lower half of x21 but is required for this instruction
    ldrb w21, [x20, #0]

    # 48 is the ASCII value of 0. If the input is less than this, then it is not a digit
    subs x22, x21, #48
    b.lt print_not_digit

    # 57 is the ASCII value of 9. If the input is greater than this, it is not a digit
    subs x22, x21, #57
    b.gt print_not_digit

    # If the process reaches here, then it must mean the input is a digit
    # bl branches to the label and saves the location of the next instruction into
    # the link register (x30)
	# We can "return" from that subroutine/function by calling br x30 at the end of it
    bl print_digit

exit:
    mov x0, #0
    mov x8, #93
    svc #0

# These instructions get hit when the input char is a digit
print_digit:
    ldr x0, =digit_string
    
	# Since we are about to bl printf, we need to preserve our old return address somewhere
	# So we use X25 as a temp register to hold it
	mov x25, x30
	bl printf
	mov x30, x25
	
    # Since we called bl before this, we can use br x30 to return to our previous location
    # b exit would also work here but for demonstration's sake br x30 is here
    br x30

# These instructions get hit when the input char is not a digit
print_not_digit:
    ldr x0, =notdigit_string
    bl printf

    b exit