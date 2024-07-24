.section .data
    numvalue: .long 0

.section .text
.globl _start

_start:
    movl $0, numvalue     # Initialize numvalue to 0

loop:
    call getchar          # Get next character
    cmpl $10, %eax        # Compare with newline (ASCII 10)
    je done               # If newline, we're done

    subl $48, %eax        # Convert ASCII to digit

    movl numvalue, %ebx   # Load current numvalue
    imull $10, %ebx       # Multiply numvalue by 10
    addl %eax, %ebx       # Add new digit

    movl %ebx, numvalue   # Store result back in numvalue

    jmp loop              # Continue loop

done:
    # Exit program (you might want to print the result instead)
    movl $1, %eax         # sys_exit system call
    xorl %ebx, %ebx       # Exit code 0
    int $0x80             # Make system call

getchar:
    # Read a single character from stdin
    pushl %ebx
    movl $3, %eax         # sys_read system call
    movl $0, %ebx         # File descriptor (0 for stdin)
    movl %esp, %ecx       # Buffer to store the character
    movl $1, %edx         # Read 1 byte
    int $0x80
    popl %eax
    ret
