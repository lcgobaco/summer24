.data

opByte:      .byte  8
opWord:      .word  100
opLong:      .long  1000

sourceByte:  .byte  64
sourceWord:  .word  4000
sourceLong:  .long  5000

.text

.globl _start

_start:
     
     movw  opWord, %ax
     imulw  %ax

     movl  opLong, %eax
     imull  %eax

     movw  opWord, %ax
     movw  opWord, %dx
     idivw  sourceWord

     movl  opLong, %eax
     movl  opLong, %edx
     idivl  sourceLong

done:
     nop
