.data

stringread:     .asciz "%s" 
lengthread:     .asciz "%d" 
strbuffer: .space 100

.text
word: .asciz "a"
.global main

/* syscall write(int fd, const void *buf, size_t count) */
/* the three arguments will be put in registers x0, x1, x2*/
/*syscall number is put in register x8.  It tells system what function to call*/

/* syscall read(int fd, const void *buf, size_t count) */
/* the three arguments will be put in registers x0, x1, x2*/
/* the item read will be in the register x1*/
/* the return value is the number of bytes read */
/*syscall number is put in register x8.  It tells system what function to call*/

main:


			ldr x0, =stringread
            ldr x1, =strbuffer
            bl scanf
ldr x5, =word

ldr x1, =strbuffer
//now x1 should have what was read
//write it out
mov x8, #64
mov x0, #1
mov x2, #2
cmp x5, x2
beq test



//what is written should be what was read



svc #0

mov x8, #64
mov x0, #1
mov x2, #1


test: ldr x1, =readformat
		bl printf

//exit the program
mov x8, #93
mov x0, #42
svc #0

ret

.section .data


readformat:
    .asciz "abcdef"
