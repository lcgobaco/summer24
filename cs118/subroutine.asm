# Name: Lucas Gobaco
# Date: 23 July 2024
# Program Name: Programming Project 11
# Program Description: This program stores an integer in eax
# and calls the print_ascii subroutine to print the integer in ascii format

# Register Use List:
# eax: stores the integer
# ebx: stores 10 to divide eax by
# ecx: stores address of output
# edx: num of characters to write
# esi: stores counter for number of digits

.data

    msg_digit:  .ascii "0"

    .equ    STDIN,0
    .equ    STDOUT,1
    .equ    READ,3
    .equ    WRITE,4
    .equ    EXIT,1
    .equ    SUCCESS,0
    .equ   NEWLINE, 10

.text

.global print_ascii

print_ascii:
    # Prologue
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi

    # The number to print is already in EAX

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
    push %eax               # save eax as it will be overwritten by syscall
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80
    pop %eax                # restore eax

    dec %esi                # decrement counter
    jmp print_digits        # loop until counter is zero

print_newline:              # prints new line
    push %eax               # save eax
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $NEWLINE, %ecx
    mov %ecx, msg_digit
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

    pop %eax                # restore eax

    # Epilogue
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp
    ret

# Example usage:
.global _start
_start:
    mov $123456789, %eax    # Move the integer to print into EAX
    call print_ascii        # Call the subroutine

    mov $987654321, %eax    # Move the integer to print into EAX
    call print_ascii        # Call the subroutine

    # Exit the program
    mov $EXIT, %eax            # system call number for exit
    xor %ebx, %ebx          # exit status 0
    int $0x80
