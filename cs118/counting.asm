# Name: Lucas Gobaco
# Date: 29 June 2024
# Program Name: Programming Project 6
# Program Description: This program counts from the value in the register eax to the value in the register ebx.

# Register Use List:
# eax: stores value to count from
# ebx: stores value to count to

.section .data
final:
    .quad 0

.section .bss

.section .text
.globl _start
_start:
    mov $15, %eax
    mov $20, %ebx

top:
    incl %eax
    cmp %ebx, %eax
    jne top

done:
    movl %eax, final(%rip)

    mov $1, %rax        # syscall: write
    mov $1, %rdi        # file descriptor 1 is stdout
    lea final(%rip), %rsi
    mov $4, %rdx        # number of bytes to write (assuming int)
    syscall

    # Exit system call
    mov $60, %rax       # syscall: exit
    xor %rdi, %rdi      # status: 0
    syscall
