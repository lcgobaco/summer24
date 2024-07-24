section .data
    newline db 10    ; ASCII code for newline

section .text
    global _start

_start:
    ; Write the newline character to stdout
    mov eax, 4        ; syscall number for sys_write
    mov ebx, 1        ; file descriptor 1 is stdout
    mov ecx, newline  ; pointer to the newline character
    mov edx, 1        ; length of the string to print
    int 0x80          ; call kernel

    ; Exit the program
    mov eax, 1        ; syscall number for sys_exit
    xor ebx, ebx      ; return 0 status
    int 0x80          ; call kernel
