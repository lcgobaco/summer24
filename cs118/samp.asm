# Name: Lucas Gobaco
# Date: 25 June 2024
# Program Name: Programming Project 4
# Program Description: This program finds the sum of a 4-element array, x.

# Register Use List:
# eax: stores how many times top should loop
# ebx: stores the current sum
# ecx: stores the address of the current number

.data

x:
	.long 1
	.long 5
	.long 2
	.long 18

sum:
	.long 0

.text

.globl _start
_start:
	movl $4, %eax

	movl $0, %ebx
	movl $x, %ecx

top:
	addl (%ecx), %ebx
	addl $4, %ecx
	decl %eax
	jnz top
done:
	movl %ebx, sum
