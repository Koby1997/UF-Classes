.data
size:           .asciz "%d"
stringread:     .asciz "%s" 
lengthread:     .asciz "%d" 
strbuffer: .space 100
enter:			.string "Please input a string \n"
space: .asciz "\n"

dee: .asciz "\nDdd\n"
see: .asciz "\nCccc\n"

same: .asciz "\nsame\n"
nope: .asciz "\nnope\n"


.text
.global main


main:       




ldr x0, =dee
bl printf
ldr x0, =see
bl printf

ldr x1, =dee
ldr x2, =see


cmp x1,x2
b.eq one
b.ne two




one:
      ldr x0,=same
      bl printf


two:
      ldr x0, =nope
      bl printf

ldr x1, =dee
ldr x2, =dee

cmp x1,x2
b.eq three
b.ne four

three:
      ldr x0,=same
      bl printf
      b exit


four:
      ldr x0, =nope
      bl printf
      b exit



exit:       mov x0, #0
            mov x8, #93
            svc #0