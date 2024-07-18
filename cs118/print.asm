.section .data
    prompt: .ascii "Hello, Assembly World!\n"
    promptSiz = . - prompt

.section .text
    .globl _start

_start:
    # Print the message
    movl    $promptSiz, %edx
    movl    $prompt, %ecx
    movl    $STDOUT, %ebx
    movl    $WRITE, %eax
    int     $0x80

    # Exit the program
    movl    $SUCCESS, %ebx
    movl    $EXIT, %eax
    int     $0x80

.equ    STDIN, 0
.equ    STDOUT, 1
.equ    READ, 3
.equ    WRITE, 4
.equ    EXIT, 1
.equ    SUCCESS, 0
