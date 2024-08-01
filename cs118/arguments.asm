# Name: Lucas Gobaco
# Date: 31 July 2024
# Program Name: Programming Project 14
# Program Description: This program puts a pointer that is an argument in a stack and increments the value the pointer points to.

# Register Use List:
#       eax: stores the number to print and stores arguments
#       ebx: stores 10 to divide eax by
#       ecx: stores address of output
#       edx: num of characters to write
#       ebp: stores pointer to the base of the stack
#       esp: stores pointer to the top of the stackstack
#       esi: stores counter for number of digits    

.data
    long1:
        .long 12345     # first integer

    long2:
        .long 98765     # second integer

    msg_digit:  
        .ascii "0"      # add to number to convert it into ascii equivalent
    
    # symbol table
    .equ    STDIN,0
    .equ    STDOUT,1
    .equ    READ,3
    .equ    WRITE,4
    .equ    EXIT,1
    .equ    SUCCESS,0
    .equ    NEWLINE, 10

.text

.global _start
_start:
    # Part a: print out value from stack
    push long1            # push argument into stack
    call print_ascii_from_stack  # calls print_ascii to print number
    add $4, %esp             # pop argument from stack

    push long2            # push argument into stack
    call print_ascii_from_stack   # calls print_ascii to print number
    add $4, %esp               # pop argument from stack

    # Part b: put pointer as argument in stack and increment the value the pointer points to
    # increment value stored at $long1 and pop
    push $long1
    call increment
    add $4, %esp

    # print incremented long1 and pop
    push long1
    call print_ascii_from_stack
    add $4, %esp

    # increment value stored at $long2 and pop
    push $long2
    call increment
    add $4, %esp

    # print incremented long2 and pop
    push long2
    call print_ascii_from_stack
    add $4, %esp

    # exits the program
    mov $EXIT, %eax
    xor %ebx, %ebx
    int $0x80


print_ascii_from_stack:
    # saves current state of stack
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi
    xor %esi, %esi          # zero out esi to use as counter

    movl 8(%ebp), %eax

next_digit:
    xor %edx, %edx          # zero out edx
    mov $10, %ebx           # move 10
    div %ebx                # divide eax by ebx
    add $'0', %edx          # add '0' in ASCII to offset edx
    push %edx               # take remainder and push into stack
    inc %esi                # increment counter
    cmp $0, %eax
    jne next_digit          # loop if eax is not zero

print_digits:
    cmp $0, %esi
    je print_newline        # print a new line if counter is zero

    pop %edx                # remove top item from stack
    mov %edx, msg_digit     # copy edx to msg_digit to print out

    # print out msg_digit
    push %eax               # save eax first as it will be overwritte
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80
    pop %eax                # restore eax

    dec %esi                # decrement counter
    jmp print_digits        # loop until counter is zero

print_newline:              # prints new line
    push %eax               # save eax first
    mov $WRITE, %eax
    mov $STDOUT, %ebx
    mov $NEWLINE, %ecx
    mov %ecx, msg_digit
    mov $msg_digit, %ecx
    mov $1, %edx
    int $0x80

    pop %eax                # restore eax

    # restores stack to original state before subroutine was called
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp
    ret

increment:
    # saves current state of stack
    push %ebp
    mov %esp, %ebp
    push %ebx
    push %esi

    movl 8(%ebp), %eax
    addl $1, (%eax)

    # restores stack to original state before subroutine was called
    pop %esi
    pop %ebx
    mov %ebp, %esp
    pop %ebp
    ret
