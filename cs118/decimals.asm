.section .data
msg_digit:  .ascii "0"
newline:    .ascii "\n"

.section .bss

.section .text
.global _start

_start:

    mov $123456789, %eax

    # Use %esi as counter
    xor %esi, %esi
next_digit:
    xor %edx, %edx
    mov $10, %ebx
    div %ebx        # eax/ebx -> edx:eax (quotient in eax, remainder in edx)
    add $'0', %dl
    push %edx
    inc %esi
    test %eax, %eax
    jnz next_digit

print_digits:
    test %esi, %esi
    jz print_newline

    pop %edx
    mov %dl, msg_digit

    # print msg_digit
    mov $4, %eax
    mov $1, %ebx
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

    dec %esi
    jmp print_digits

print_newline:
    mov $4, %eax
    mov $1, %ebx
    mov $newline, %ecx
    mov $1, %edx
    int $0x80

end_program:
    # exit syscall
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
