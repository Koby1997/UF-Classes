.global main
.section .text

enter:          .string "please input a string \n"

main:

/* syscall write(int fd, const void *buf, size_t count) */
    /* the three arguments will be put in registers x0, x1, x2*/
    /*syscall number is put in register x8.  It tells system what function to call*/



ldr x0, =enter
bl printf

    mov x0, #1
    ldr x1, =string
    mov x2, #3
    mov x8, #0x40 //hex 40 for write  (decimal 64)
    svc #0 //do it!

    //exit the program
    mov x8, #93
    mov x0, #42
    svc #0

    ret

            .section .data

    string:
        .asciz "ummmmm"