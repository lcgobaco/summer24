# Name: Lucas Gobaco
# Date: 27 June 2024
# Program Name: Programming Project 5
# Program Description: This program finds the sum of a variable size array, x.

# Register Use List: 
# ebx: stores current sum
# ecx: stores address of current number

.data

x:
	.long 39
	.long 59
	.long 93
	.long 0

sum:
	.long 0

.text

.globl _start
_start:
	movl $0, %ebx
	movl $x, %ecx

top:
	addl (%ecx), %ebx
	addl $4, %ecx
	cmp $0, (%ecx)
	jnz top
done: 
	movl %ebx, sum
