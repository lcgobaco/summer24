.section .data
msg_digit:  .ascii "0"
newline:    .ascii "\n"

.section .bss

.section .text
.global _start

_start:
    mov $123456789, %rax
    xor %r8, %r8

# uses %r8 as counter
next_digit:
    xor %rdx, %rdx
    mov $10, %rbx
    div %rbx
    add $'0', %rdx
    push %rdx
    add $1, %r8
    test %rax, %rax
    jg next_digit

print_digits:
    cmp $0, %r8
    je end_program

    pop %rdx
    mov %dl, msg_digit

    #print msg_digit
    mov $1, %rax
    mov $1, %rdi
    mov $msg_digit, %rsi
    mov $1, %rdx
    syscall

    sub $1, %r8
    jg print_digits

end_program:

    mov %ax,0x4c00
    int $0x21
