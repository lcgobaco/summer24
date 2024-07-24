# Name: Lucas Gobaco
# Date: 18 July 2024
# Program Name: Programming Project 9
# Program Description: This program stores an integer in eax and displays its digits by converting them into ASCII, and then printing in ASCII. 

# Register Use List:
# eax: stores the integer
# 

.data

msg_digit:  .ascii "0"
newline:    .ascii "\n"

.text

.global _start
_start:
    mov $123456789, %eax
    xor %ecx, %ecx        # zero out ecx

next_digit:
    xor %edx, %edx  
    mov $10, %ebx
    div %ebx        # eax/ebx -> edx:eax (quotient in eax, remainder in edx)
    add $'0', %dl
    push %edx
    inc %ecx
    test %eax, %eax
    jnz next_digit

print_digits:
    test %ecx, %ecx
    jz print_newline

    pop %edx
    mov %dl, msg_digit

    # print msg_digit
    mov $4, %eax
    mov $1, %ebx
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

    dec %ecx
    jmp print_digits

print_newline:
    mov $4, %eax
    mov $1, %ebx
    mov $newline, %ecx
    mov $1, %edx
    int $0x80

done:
    # exit
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
