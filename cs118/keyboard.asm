.section .data
    numvalue: .long 0
    buffer: .space 1

.section .text
.globl _start

_start:
    movl $0, numvalue     # Initialize numvalue to 0

loop:
    mov $0, %eax
    call getchar          # Get next character
    cmp $10, %eax        # Compare with newline (ASCII 10)
    je done               # If newline, we're done

    sub $48, %eax        # Convert ASCII to digit

    mov numvalue, %ebx   # Load current numvalue
    imul $10, %ebx       # Multiply numvalue by 10
    add %eax, %ebx       # Add new digit

    mov %ebx, numvalue   # Store result back in numvalue

    jmp loop              # Continue loop

done:
    # Exit program (you might want to print the result instead)
    mov $1, %eax         # sys_exit system call
    xor %ebx, %ebx       # Exit code 0
    int $0x80             # Make system call

getchar:
    # Prologue
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi

    # Read a single character from stdin
    mov $3, %eax         # sys_read system call
    mov $0, %ebx         # File descriptor (0 for stdin)
    mov $buffer, %ecx      # Buffer to store the character
    mov $1, %edx         # Read 1 bytes
    int $0x80

    mov buffer, %eax

    # Epilogue
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp

    ret
