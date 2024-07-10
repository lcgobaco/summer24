.section .text
.globl _start

_start:
    # Add two numbers
    movq $5, %rax    # First number
    movq $3, %rbx    # Second number
    addq %rbx, %rax  # Add rbx to rax, result in rax

    # Convert result to ASCII
    movq $10, %rbx   # Divisor for conversion
    movq $result, %rsi
    addq $9, %rsi    # Point to the end of the buffer

    movq $10, %rcx   # Loop counter

convert_loop:
    xorq %rdx, %rdx  # Clear upper bits of dividend
    divq %rbx        # Divide rax by 10
    addb $'0', %dl   # Convert remainder to ASCII
    movb %dl, (%rsi) # Store digit
    decq %rsi        # Move pointer
    loop convert_loop

    # Print result
    movq $1, %rax    # syscall: sys_write
    movq $1, %rdi    # file descriptor: stdout
    movq $result, %rsi # pointer to result string
    movq $11, %rdx   # length of string
    syscall

    # Exit
    movq $60, %rax   # syscall: sys_exit
    xorq %rdi, %rdi  # status: 0
    syscall

.section .data
result:
    .ascii "           " # 11 spaces for up to 10 digits plus newline
