# Name: Lucas Gobaco
# Date: 16 July 2024
# Program Name: Programming Project 8
# Program Description: This program counts from the value in the register eax to the value in the register ebx.

# Register Use List:
# ax: stores value to copy bits from
# bx: register that loop copies ax's bits to
# cx: stores mask to and ax to

.data

result:
	.word 0

.text

.globl _start
_start:
	movw $100, %ax
	movw $0b1000000000000000, %cx

display:
	movw %ax, %dx
	shr %cx 
	andw %cx, %dx
	addw %dx, %bx
	cmp $0, %ax
	jnz display
done:
	movw %bx, result
