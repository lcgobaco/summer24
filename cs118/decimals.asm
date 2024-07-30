# Name: Lucas Gobaco
# Date: 18 July 2024
# Program Name: Programming Project 9
# Program Description: This program stores an integer in eax and displays its digits by converting them into ASCII, and then printing in ASCII.

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
    .equ    NEWLINE, 10

.text

.global _start
_start:
    mov $123456789, %eax    # move integer to eax
    xor %esi, %esi          # zero out esi to use as counter

next_digit:
    xor %edx, %edx          # zero out edx
    mov $10, %ebx           # move 10
    div %ebx                # divide eax by edx
    push %edx               # take remainder and push into stack
    inc %esi                # increment counter
    cmp $0, %eax
    jne next_digit          # loop if eax is not zero

print_digits:
    cmp $0, %esi
    je print_newline        # print a new line if counter is zero

    pop %edx                # remove top item from stack
    add $'0', %edx          # add 0 in ASCII to offset edx
    mov %edx, msg_digit     # copy edx to msg_digit to print out

    # print out msg_digit
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

    dec %esi                # decrement counter
    jmp print_digits        # loop until counter is zero

print_newline:              # prints new line
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $NEWLINE, %ecx
    mov %ecx, msg_digit
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

done:
    mov $EXIT, %eax     # exit instruction
    xor %ebx, %ebx      # zero out ebx
    int $0x80
