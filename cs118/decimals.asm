.section .data
msg_digit:  .ascii "0"
newline:    .ascii "\n"

.section .bss

.section .text
.global _start

_start:
    mov $123456789, %rax
    xor %r8, %r8

next_digit:
    xor %rdx, %rdx
    mov $10, %rbx
    div %rbx
    push %rdx
    add $1, %r8
    test %rax, %rax
    jnz next_digit

print_digits:
    cmp $0, %r8
    je end_program

    pop %rdx
    addb $'0', %dl
    mov %dl, msg_digit

    mov $1, %rax
    mov $1, %rdi
    mov $msg_digit, %rsi
    mov $1, %rdx
    syscall

    sub $1, %r8
    jmp print_digits

end_program:
    mov $1, %rax
    mov $1, %rdi
    mov $newline, %rsi
    mov $1, %rdx
    syscall
