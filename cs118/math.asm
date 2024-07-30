# Name: Lucas Gobaco
# Date: 30 July 2024
# Program Name: Programming Project 13
# Program Description: This program reads two integers from the keyboard
#    and then prints out their sum.

# Register Use List:
# eax: stores current keystroke
# ebx: temporarily stores final integer
# ecx: stores location to read from
# edx: stores maximum number of characters to read

.data
    numvalue: .long 0       # stores resulting integer
    buffer: .space 1        # stores current keystroke
    int1: .long 0           # first integer
    int2: .long 0           # second integer

    # symbol table
    .equ    STDIN,0
    .equ    READ,3
    .equ    EXIT,1
    .equ    RETURN, 10

.text

.globl _start
_start:
    # First call to read_int
    call read_int
    mov numvalue, %eax
    push %eax  # Save the first number on the stack

    # Second call to read_int
    call read_int

    # Add the two numbers
    pop %ebx   # Get the first number from the stack
    add numvalue, %ebx  # Add the second number to it

    # The sum is now in %ebx

done:
    # gracefully exit out of program
    mov $EXIT, %eax
    xor %ebx, %ebx
    int $0x80

read_int:
    # saves current state of stack
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi

    movl $0, numvalue     # initializes numvalue to zero

loop:
    mov $0, %eax        # initialize eax
    call getchar        # load keystroke into eax
    cmp $RETURN, %eax
    je end_read_int      # if return key was pressed, end program

    sub $48, %eax       # convert current keystroke from ascii to integer

    mov numvalue, %ebx   # temporarily store current integer into ebx
    imul $10, %ebx       # multiply ebx by 10 to prepare for next digit
    add %eax, %ebx       # add current digit to ebx

    mov %ebx, numvalue   # copy ebx back to numvalue

    jmp loop             # loop again until return key is pressed

end_read_int:
    # restores stack to original state before subroutine was called
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp

    ret

getchar:
    # saves current state of stack
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi

    mov $READ, %eax         # constant for reading
    mov $STDIN, %ebx         # constant for stdin
    mov $buffer, %ecx    # location to read
    mov $1, %edx         # maximum number of characters to read
    int $0x80

    mov buffer, %eax    # moves keystroke to eax

    # restores stack to original state before subroutine was called
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp
    ret

