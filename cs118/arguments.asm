# Name: Lucas Gobaco
# Date: 26 July 2024
# Program Name: Programming Project 11
# Program Description: This program takes in a number in eax and calls the print_ascii subroutine to print the number in ascii format.

# Register Use List:
# eax: stores the number to print
# ebx: stores 10 to divide eax by
# ecx: stores address of output
# edx: num of characters to write
# ebp: stores pointer to the base of the stack
# esp: stores pointer to the top of the stackstack
# esi: stores counter for number of digits

.data
    msg_digit:  .ascii "0"      # add to number to convert it into ascii equivalent

    # symbol table
    .equ    STDIN,0
    .equ    STDOUT,1
    .equ    READ,3
    .equ    WRITE,4
    .equ    EXIT,1
    .equ    SUCCESS,0
    .equ    NEWLINE, 10

.text

.global _start
_start:
    push $123456789   # push argument into stack
    call print_ascii  # calls print_ascii to print number

    push $987654321    # push argument into stack
    call print_ascii   # calls print_ascii to print number

    # exits the program
    mov $EXIT, %eax
    xor %ebx, %ebx
    int $0x80

print_ascii:
    # saves current state of stack
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi
    xor %esi, %esi          # zero out esi to use as counter

    movl 8(%ebp), %eax

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
