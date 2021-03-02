.global _start
.section .text

_start:
	mov x0, #1
	mov x2, #20
	mov x8, #0x40
	ldr x1, =message
	svc #0

	mov x8, #93
	mov x0, #0
	svc #0

	.section .data
message:
	.asciz "\nHellllllo worldz\n"

note:
	.asciz "is this right?\n"