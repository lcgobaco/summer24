# Name: Lucas Gobaco
# Date: 16 July 2024
# Program Name: Programming Project 8
# Program Description: This program takes the bits of ax and puts it into bx, one at a time, starting with the least significant bit.

# Register Use List:
# ax: stores value to copy bits from
# bx: stores mask
# cx: stores current digit

.data

value:
	.word 0b0000000001100101		# 101 in decimal

.text

.globl _start
_start:
	movw value, %ax				
	movw $0b1000000000000000, %bx	# mask

display:
	movw %ax, %cx		# copy ax to cx 
	andw %bx, %cx		# use mask
	cmp $0, %cx		
	je nostore			# if digit is zero, jump to nostore
	movw $1, %cx		
	jmp nostore			# if not, change cx and continue
	
nostore:
	shr %bx				# shift mask right by 1
	cmp $0, %bx			
	jne display			# if mask is not 0, loop again
