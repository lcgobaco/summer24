# Name: Lucas Gobaco
# Date: 28 July 2024
# Program Name: Programming Project 12
# Program Description: This program reads an integer from the keyboard and then returns it into eax.

# Register Use List:
# eax: stores current keystroke 
# ebx: temporarily stores final integer
# ecx: stores location to read from
# edx: stores maximum number of characters to read

.data
    numvalue: .long 0       # stores resulting integer
    buffer: .space 1        # stores current keystroke

    # symbol table
    .equ    STDIN,0
    .equ    READ,3
    .equ    EXIT,1
    .equ    RETURN, 10

.text

.globl _start
_start:
    movl $0, numvalue     # initializes numvalue to zero

loop:
    mov $0, %eax        # initialize eax
    call getchar        # load keystroke into eax
    cmp $RETURN, %eax       
    je done             # if return key was pressed, end program

    sub $48, %eax       # convert current keystroke from ascii to integer

    mov numvalue, %ebx   # temporarily store current integer into ebx
    imul $10, %ebx       # multiply ebx by 10 to prepare for next digit
    add %eax, %ebx       # add current digit to ebx

    mov %ebx, numvalue   # copy ebx back to numvalue

    jmp loop             # loop again until return key is pressed

done:
    # gracefully exit out of program
    mov $EXIT, %eax      
    xor %ebx, %ebx      
    int $0x80            

getchar:
    mov $READ, %eax         # constant for reading
    mov $STDIN, %ebx         # constant for stdin
    mov $buffer, %ecx    # location to read
    mov $1, %edx         # maximum number of characters to read
    int $0x80

    mov buffer, %eax    # moves keystroke to eax

    ret
