.section .data
    numvalue: .long 0

.section .text
.globl _start

_start:
    movl $0, numvalue     # Initialize numvalue to 0

loop:
    movl $0, %ecx
    call getchar          # Get next character
    cmpl $10, %ecx        # Compare with newline (ASCII 10)
    je done               # If newline, we're done

    subl $48, %ecx        # Convert ASCII to digit

    movl numvalue, %ebx   # Load current numvalue
    imull $10, %ebx       # Multiply numvalue by 10
    addl %ecx, %ebx       # Add new digit

    movl %ebx, numvalue   # Store result back in numvalue

    jmp loop              # Continue loop

done:
    # Exit program (you might want to print the result instead)
    movl $1, %eax         # sys_exit system call
    xorl %ebx, %ebx       # Exit code 0
    int $0x80             # Make system call

getchar:
    # Prologue
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi

    # Read a single character from stdin
    movl $3, %eax         # sys_read system call
    movl $0, %ebx         # File descriptor (0 for stdin)
    movl %esp, %ecx       # Buffer to store the character
    movl $1, %edx         # Read 1   bytes
    int $0x80
    popl %ecx

    # Epilogue
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp

    ret
