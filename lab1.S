#Find the index of the max element of an array MxN, where N=4, M=3
#Pass parameters using the stack
.data
N:
.word 4
M:
.word 3
matrix:
.word 1, 2, 0, 1
.word 2, 3, 5, -6
.word 0, 3, 1, 2
result:
.word 0
.word 0

.text

main:
la a5, result # result
sw a5, 0(sp)
addi sp, sp, -4

la a4, matrix # matrix
sw a4, 0(sp)
addi sp, sp, -4

la a3, M 	  # M
lw a3, 0(a3)
sw a3, 0(sp)
addi sp, sp, -4

la a2, N 	  # N
lw a2, 0(a2)
sw a2, 0(sp)
addi sp, sp, -4

call process
call print
call exit

print:
addi a0, x0, 1  #print_int
lw a1, 0(a5)  
ecall

addi a0, x0, 11 # print_char
addi a1, x0, 32
ecall

addi a0, x0, 1  #print_int
addi, a5, a5, 4
lw a1, 0(a5)
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
addi sp, sp, 4 # N
lw a2, 0(sp)

addi sp, sp, 4 # M
lw a3, 0(sp)

addi sp, sp, 4 # matrix
lw t6, 0(sp)   # load address of the first value from array

addi sp, sp, 4 # result address
lw t0, 0(sp)

addi sp, sp, -16 # restoration sp 

addi t1, x0, 0 # row pointer
lw t5, 0(t6)   # max value

addi t3, x0, 1 # i index = row pointer of max element
addi t4, x0, 1 # j index = column pointer of max element

init:
addi t2, x0, 0 # column pointer
addi t1, t1, 1 # increment row pointer

cycle:
addi t2, t2, 1 # increment column pointer
lw a4, 0(t6)
addi t6, t6, 4 # increment array pointer
blt t5, a4, change_max

next:
bne t2, a2, cycle
bne t1, a3, init
sw t3, 0(t0)
addi t0, t0, 4
sw t4, 0(t0)
ret

change_max:
add t5, x0, a4
add t3, x0, t1
add t4, x0, t2
j next