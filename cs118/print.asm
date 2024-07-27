# Name: Lucas Gobaco
# Date: 26 July 2024
# Program Name: Programming Project 10
# Program Description: This program takes a string and prints it out in the terminal.

# Register Use List:
# eax: stores constant for write
# ebx: stores constant for stdout
# ecx: stores address of output
# edx: stores number of characters to write
# esi: stores counter for number of digits

.data
    prompt: .ascii "Hello, Assembly World!\n"   # creates string using .ascii
    promptSiz = . - prompt                      # '.' represents the current address, so ". - prompt" calculates the difference between the two addresses and saves it into promptSiz
 
    # symbol table
    .equ    STDIN, 0
    .equ    STDOUT, 1
    .equ    READ, 3
    .equ    WRITE, 4
    .equ    EXIT, 1
    .equ    SUCCESS, 0

.text

.globl _start
_start: # prints the prompt
    movl    $promptSiz, %edx
    movl    $prompt, %ecx
    movl    $STDOUT, %ebx
    movl    $WRITE, %eax
    int     $0x80

done:   # exits the program
    movl    $SUCCESS, %ebx
    movl    $EXIT, %eax
    int     $0x80
