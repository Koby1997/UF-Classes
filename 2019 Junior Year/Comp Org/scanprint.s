# scanprint.s
# Hugh Wu
# This program demonstrates the use of the scanf and printf C functions
# It takes in input from the user and prints out the string "Hello, <input>"

# The data section holds the global and static variables
.data
	# The labels are addresses that we can reference with a name
	# .asciz is a directive that creates the given ASCII string and null terminates it
	# .space allocates n number of bytes
    hello_string:           .asciz "Hello, "
    newline:                .asciz "\n"

    string_specifier:       .asciz "%s"
    string_input_buffer:    .space 256

# .global is an assembler directive that makes the main symbol visible to outside files
# In this case, it is necessary for the gcc compiler to create the final executable 
.global main

# The text section holds the actual program and its instructions
.text

# The main label denotes the start of execution
main:
    # Following the convention for scanf, we put the specifier in register x0
    # and the address in memory we want the input saved in register x1
    # ldr x0, =label is actually a pseudoinstruction, but it allows us to load the
    # address of a label in one line
    ldr x0, =string_specifier
    ldr x1, =string_input_buffer

    # Call the C scanf function
    # After the call, the input will be saved in the input_buffer
    bl scanf

    # Following the convention for printf, we put the address of the string we want
    # printed into register x0
    ldr x0, =hello_string
    bl printf

    # Same as above, but now we're loading the input
    ldr x0, =string_input_buffer
    bl printf

    # To see the output on the terminal, we need to flush the buffer by printing a newline
    ldr x0, =newline
    bl printf

exit:
    # Call to exit the program
    # The svc is essentially a syscall to the OS
    mov x0, #0
    mov x8, #93
    svc #0