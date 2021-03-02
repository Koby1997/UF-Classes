.data

flush:            .asciz "\n"

question:         .asciz "Enter Two Integers: "     //begining question

numberread:       .asciz "%d"
numbertwo:        .asciz "%d"

numberbuffer:     .space 256
numberbuffertwo:  .space 256

answer:           .asciz "%d"
answerbuff:       .space 256

error:            .asciz "Error: Cannot read operation"
error_two:        .asciz "Error: Cannot divide by 0"
test:             .asciz "I made it here"
less:             .asciz "less"
greater:          .asciz "more"
same:             .asciz "same"


negative:         .asciz "%c"


.global main
.text


main:       
            ldr x0, =question                       //ask for Integers
            bl printf

            ldr x0, =numberread
            ldr x1, =numberbuffer
            bl scanf
            ldr x1, =numberbuffer                   //First number
           
            ldrsb w22, [x1, #0]
            cmp w22, 0
            b.gt POSITIVEA
            neg w22, w22            //if not greater than 0, change to positive

POSITIVEA:


            ldr x0, =numbertwo
            ldr x1, =numberbuffertwo
            bl scanf
            ldr x1, =numberbuffertwo                  //Second Number

            ldrsb w23, [x1, #0]
            cmp w23, 0
            b.eq exit                    //if the second is 0, it is the same answer as if it is the same, so save time by putting this
            b.gt POSITIVEB
            neg w23, w23

POSITIVEB:       //dont really need this but it helped me think    


GCD:
            //w22  = A
            //w23  = B

            cmp w23, 0
            b.gt recurse



base:
            stp x30, x1, [sp, #-16]!
            ldp x30, x1, [sp], #16

            #Go back and start executing at the return
            #address that we stored 
            br x30




recurse:    
            sdiv w0, w22, w23        //gets quotient
            mul w1, w0, w23
            sub w24, w22, w1        // remainder is now in w23 = r



            mov w22, w23            //instead of GCD(A,B)
            mov w23, w24            //We now need to do GDC(B,r)


            #First we store the frame pointer(x29) and 
            #link register(x30)
            sub sp, sp, #16
            str x29, [sp, #0]
            str x30, [sp, #8]

            #Move our frame pointer
            add x29, sp, #8

            #Make room for the index on the stack
            sub sp, sp, #16

            #Store it with respect to the frame pointer
            str x2, [x29, #-16]

            add x2, x2, #1 

            #Branch and link to original function. 
            bl GCD




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
