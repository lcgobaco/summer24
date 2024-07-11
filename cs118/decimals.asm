.section .data
msg_digit:  .ascii "0"
newline:    .ascii "\n"

.section .bss

.section .text
.global _start

_start:
    mov $123456789, %rax
    xor %rcx, %rcx

next_digit:
    xor %rdx, %rdx
    mov $10, %rbx
    div %rbx
    push %rdx
    inc %rcx
    test %rax, %rax
    jnz next_digit

print_digits:
    cmp $0, %rcx
    je end_program

    pop %rdx
    addb $'0', %dl
    mov %dl, msg_digit

    mov $1, %rax
    mov $1, %rdi
    mov $msg_digit, %rsi
    mov $1, %rdx
    syscall

    dec %rcx
    jmp print_digits

end_program:
    mov $1, %rax
    mov $1, %rdi
    mov $newline, %rsi
    mov $1, %rdx
    syscall

    mov $60, %rax
    xor %rdi, %rdi
    syscall
