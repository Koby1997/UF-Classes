.global	_start
_start:

	adr R3, numbers
	ldmia R3, {R5-R8}
	mov R0, R6

end:
	mov R7, #1
	swi 0

.align 2
numbers:
	.word 1,2,3,4