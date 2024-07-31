# Name: Lucas Gobaco
# Date: 29 July 2024
# Program Name: Programming Project 13
# Program Description: This program reads two integers, adds them together, and then prints the sum out.

# Register Use List:
# eax: stores current keystroke 
# ebx: temporarily stores final integer
# ecx: stores location to read from
# edx: stores maximum number of characters to read 

.data

char: 
    .ascii "0"      # add to number to convert it into ascii equivalent

read_int:
    .long 0

int1:
    .long 0

int2:
    .long 0

sum:
    .long 0

    # symbol table
    .equ    STDIN,0
    .equ    STDOUT,1
    .equ    READ,3
    .equ    WRITE,4
    .equ    EXIT,1
    .equ    SUCCESS,0
    .equ    RETURN, 10

.text

.global _start
_start:
    call 
    mov %eax, int2

    add int1, sum           # add int1 to sum
    add int2, sum           # add int2 to sum

    mov sum, %eax          # move sum to print into eax
    call print_ascii        # calls print_ascii to print number

    # exits the program
    mov $EXIT, %eax       
    xor %ebx, %ebx          
    int $0x80

.global print_ascii
print_ascii:    
    # saves current state of stack
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi
    xor %esi, %esi          # zero out esi to use as counter

next_digit:
    xor %edx, %edx          # zero out edx
    mov $10, %ebx           # move 10
    div %ebx                # divide eax by ebx
    add $'0', %edx          # add '0' in ASCII to offset edx
    push %edx               # take remainder and push into stack
    inc %esi                # increment counter
    cmp $0, %eax
    jne next_digit          # loop if eax is not zero

print_digits:
    cmp $0, %esi
    je print_newline        # print a new line if counter is zero

    pop %edx                # remove top item from stack
    mov %edx, msg_digit     # copy edx to msg_digit to print out

    # print out msg_digit
    push %eax               # save eax first as it will be overwritte
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80
    pop %eax                # restore eax

    dec %esi                # decrement counter
    jmp print_digits        # loop until counter is zero

print_newline:              # prints new line
    push %eax               # save eax first
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $NEWLINE, %ecx
    mov %ecx, msg_digit
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

    pop %eax                # restore eax

    # restores stack to original state before subroutine was called
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp
    ret

read:
    mov $0, %eax        # initialize eax
    call getchar        # load keystroke into eax
    cmp $RETURN, %eax       
    je done             # if return key was pressed, end program

    sub $48, %eax       # convert current keystroke from ascii to integer

    mov numvalue, %ebx   # temporarily store current integer into ebx
    imul $10, %ebx       # multiply ebx by 10 to prepare for next digit
    add %eax, %ebx       # add current digit to ebx

    mov %ebx, numvalue   # copy ebx back to numvalue

    jmp read            # loop again until return key is pressed

getchar:
    mov $READ, %eax         # constant for reading
    mov $STDIN, %ebx         # constant for stdin
    mov $buffer, %ecx    # location to read
    mov $1, %edx         # maximum number of characters to read
    int $0x80

    mov buffer, %eax    # moves keystroke to eax

    ret