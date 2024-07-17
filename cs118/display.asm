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
	#movw $101, %ax
	movw $0b0000000001100101, %ax
	#movw $0b1000000000000000, %cx
	movw $0b1000000000000000, %cx

display:
	movw %ax, %dx
	andw %cx, %dx
	addw %dx, %bx
	shr %cx
	cmp %bx, %ax
	jne display
done:
	movw %bx, result
