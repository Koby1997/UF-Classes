.data
    hello_string:       .asciz "Hello "
    newline:            .asciz "\n"
    string_specifier:   .asciz "%s"

    input_buffer1:      .space 256
    input_buffer2:      .space 256

.global main

.text

main:
    # Save the first input into the buffer
    ldr x0, =string_specifier
    ldr x1, =input_buffer1
    bl scanf

    # You might think you could skip loading string specifier since it's already loaded into x0,
    # but the scanf function overwrites register values
    # ldr x0, =string_specifier # Need to include this line
    ldr x1, =input_buffer2

    ldr x0, =input_buffer1
    bl printf

    ldr x0, =input_buffer2
    bl printf

exit:
    mov x0, #0
    mov x8, #93
    svc #0