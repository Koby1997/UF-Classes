.data
enter: .asciz "Please input a string\n"


 
size: .asciz "%d\n"
ispal: .asciz "True\n"
notpal: .asciz "False\n"
frontchar: .asciz "%s\n"
backchar: .asciz "%s\n"
space: .asciz "\n"
bug: .asciz "\nit gets here\n"

formattwo: .asciz "%c"


//I know I have a lot of .data, but I was still trying to find the last problem to my code and was using these



.text
.global main
main:

        ldr x0, =stringread
        ldr x1, =enter      //ask for string
        bl printf

        svc #0


        ldr x0, =stringread
        ldr x1, =strbuffer
        bl scanf            //take in string



        ldr x29, =strbuffer
        mov x14, #0         //this will be used to count the length

        bl findlength       //go to findlength, starts recursion

                            //recursion is done



        ldr x0, =size
        bl printf           //Prints string length
        



        

            


            ldr x0, =stringread
            ldr x1, =strbuffer
           

            ldr x0, =lengthread
            ldr x1, =lenbuffer
           

                                        
            ldr x0, =lenbuffer          //Get length read in
            ldr x0, [x0, #0]

                                        
            sub x0, x0, #1              //Change length to length-1
            
            ldr x1, =strbuffer          //Move string address to x1

            
            mov x2, #0                  //Starting index for reverse
            mov x7, #0
          //  ldrb w2, [x1, x7]

            
            bl reverse                  //Branch to reverse, setting return address

            
            ldr x0, =flush              //Flush the stdout buffer
            bl printf

            bl true

            
            b exit                      //Exit the program


reverse:    //In reverse we want to maintain
            //x0 is length-1
            //x1 is memory location where string is
            //x2 is index

            subs x3, x2, x0
            

            #If we haven't reached the last index, recurse
            b.lt recurse                

base:       #We've reached the end of the string. Print!
           ldr x0, =outformat
           
           
        
            #We need to keep x1 around because that's the string address!
            #Also bl will overwrite return address, so store that too

            stp x30, x1, [sp, #-16]!
            ldrb w1, [x1, x2]
            //ldrb w2, [x1,x7]
            //add x7, x7, #1
            //cmp w1,w2
            //b.ne false
            bl printf
            ldp x30, x1, [sp], #16


            #Go back and start executing at the return
            #address that we stored 
            br x30

recurse:    #First we store the frame pointer(x29) and 
            #link register(x30)
            sub sp, sp, #16
            str x29, [sp, #0]
            str x30, [sp, #8]
ldr x0, =bug
bl printf
            #Move our frame pointer
            add x29, sp, #8

            #Make room for the index on the stack
            sub sp, sp, #16

            #Store it with respect to the frame pointer
            str x2, [x29, #-16]

            add x2, x2, #1 

            #Branch and link to original function. 
            bl reverse

            #Back from other recursion, so load in our index
end_rec:    ldr x2, [x29, #-16]
            stp x30, x1, [sp, #-16]!
            ldr x0, =outformat
            ldrb w1, [x1, x2]
            //ldrb w2, [x1, x7]
            //add w7, w7, #1
            //cmp w1, w2
            b.ne false


            bl printf
            ldp x30, x1, [sp], #16

            #Clear off stack space used to hold index
            add sp, sp, #16

            #Load in fp and lr
            ldr x29, [sp, #0]
            ldr x30, [sp, #8]
            
            #Clear off the stack space used to hold fp and lr
            add sp, sp, #16

            #Return to correct location in execution
            br x30








        b exit





findlength:


        mov x13, x30            //x30 is link register
        ldrb w1, [x14, x29] //took me forever to realize to use w1 and not x1
        cbz w1, done            //if its ==0 go to done
        add x14, x14, #1        //x14++
        b findlength        

done:
        mov x1, x14         
        br x13





true:                       //if it is a palendrome
        ldr x0, =ispal
        bl printf

        b exit

false:                      //if it is NOT a palendrome
        ldr x0, =notpal
        bl printf



        exit:       mov x0, #0
                    mov x8, #93
                    svc #0