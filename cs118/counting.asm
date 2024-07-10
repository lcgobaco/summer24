# Name: Lucas Gobaco
# Date: 29 June 2024
# Program Name: Programming Project 6
# Program Description: This program counts from the value in the register eax to the value in the register ebx.

# Register Use List:
# eax: stores value to count from
# ebx: stores value to count to

.data

final:
	.long 0

.text

.globl _start
_start:
	movl $15, %eax
	movl $20, %ebx

top:
	incl %eax
	cmp %eax, %ebx
	jne top
done:
	movl %eax, final
