.section .data
hello:
    .asciz "Hello, world!\n"

.section .text
.global _start

_start:
    # Write "Hello, world!" to stdout
    mov $1, %rax        # system call for write
    mov $1, %rdi        # file descriptor 1 is stdout
    mov $hello, %rsi    # address of string to output
    mov $13, %rdx       # number of bytes
    syscall             # invoke operating system to do the write

    # Exit
    mov $60, %rax       # system call for exit
    xor %rdi, %rdi      # exit code 0
    syscall             # invoke operating system to exit
    