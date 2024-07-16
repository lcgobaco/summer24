.section .text
.global _start

_start:
    # Store 0b1010101010101010 in %ax
    movw $43690, %ax

    # Use %cx as our loop counter (16 bits in %ax)
    movw $16, %cx

display_loop:
    # bl "display" register
    xorb %bl, %bl

    # Test the least significant bit of %ax
    testw $1, %ax

    # If the bit is 0, skip the bit
    jz skip_set

    # If the bit is 1, set %bl to 1
    incb %bl

skip_set:
    # Shift %ax right by 1 bit
    shrw $1, %ax

    # Decrement our loop counter
    decw %cx

    # If %cx is not zero, continue the loop
    jnz display_loop

    # Exit the program
    movl $60, %eax   # syscall: exit
    xorl %edi, %edi  # status: 0
    syscall
