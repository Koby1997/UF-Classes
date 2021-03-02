.data

flush:		.asciz "\n"

question:         .asciz "Enter Two Integers: "     //begining question

numberread:		.asciz "%d"
numbertwo:		.asciz "%d"

numberbuffer:	.space 256
numberbuffertwo:  .space 256

answer:		.asciz "%d"
answerbuff:		.space 256

test:             .asciz "I made it here"            //This was used to test/debug


.global main
.text


main:		stp x29, x30, [sp, -16]!
            mov x29, sp


		ldr x0, =question                       //ask for Integers
            bl printf

            ldr x0, =numberread
            ldr x1, =numberbuffer
            bl scanf
		ldr x1, =numberbuffer 		          //First number
           
            ldrsb w22, [x1, #0]
            cmp w22, 0
            b.gt POSITIVEA                          //if greater than 0, skip next step
            neg w22, w22                            //if not greater than 0, change to positive

POSITIVEA:


            ldr x0, =numbertwo
            ldr x1, =numberbuffertwo
            bl scanf
            ldr x1, =numberbuffertwo 	          //Second Number

            ldrsb w23, [x1, #0]
            cmp w23, 0
            b.eq exit                               //if the second is 0, it is the same answer as if it is the same, so save time by putting this
            b.gt POSITIVEB                          //if greater than 0, skip next step
            neg w23, w23                            //if not greater than 0, change to positive

POSITIVEB:       //dont really need this but it helped me think. could have put b.gt GCD


GCD:
            //w22  = A
            //w23  = B

            cmp w23, 0
            b.gt recurse



base:
            stp x30, x1, [sp, #-16]!
            ldp x30, x1, [sp], #16

            br x30




recurse:    
            sdiv w0, w22, w23        //gets quotient
            mul w1, w0, w23
            sub w24, w22, w1        // remainder is now in w23 = r



            mov w22, w23            //instead of GCD(A,B)
            mov w23, w24            //We now need to do GDC(B,r)

            sub sp, sp, #16
            str x29, [sp, #0]       //store the frame pointer
            str x30, [sp, #8]       //store link register

            add x29, sp, #8         //move frame pointer

            sub sp, sp, #16         //make room on stack

            #Store our A with respect to the frame pointer
            #A will be our final answer when B = 0
            #this meant that the last remaider was 0
            str x22, [x29, #-16]
 
            bl GCD                   //Branch and link to GCD with new inputs
                                     //When b cx30 is called, it will come here, to the exit





exit:       
            ldr x0, =answer
            mov x1, x22
            bl printf

            ldr x0, =flush
            bl printf
            mov x0, #0
            mov x8, #93
            svc #0





//ldr x0, =test
//bl printf
//ldr x0, =flush
//bl printf
