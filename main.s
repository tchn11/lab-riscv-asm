.data
N:
.word 3
M:
.word 3
matrix:
.word 1, 2, 3
.word 4, 5, 6
.word 7, 8, 9
result:
.word 0

.text
main:
    la a2, N
    la a3, M
    la a4, matrix
    la a5, result
    call process
    la a2, result
    call print
    call exit

print:
    addi a0, x0, 1
    lw a1, 0(a2)
    ecall
    ret

exit:
    addi a0, x0, 10
    ecall

process:
    lw t1, 0(a2)
    lw t2, 0(a3)
    
    addi t3, x0, 0
    li t4, 0x7FFFFFFF
    
    addi t5, x0, 0
    
col_loop:
    bge t5, t2, end_col
    addi t6, x0, 0
    addi a7, x0, 0
    
row_loop:
    bge a7, t1, end_row
    
    mul t0, a7, t2
    add t0, t0, t5
    slli t0, t0, 2
    add t0, a4, t0
    
    lw s0, 0(t0)
    add t6, t6, s0
    
    addi a7, a7, 1
    j row_loop

end_row:
    bge t6, t4, not_min
    mv t3, t5
    mv t4, t6
    
not_min:
    addi t5, t5, 1
    j col_loop

end_col:
    sw t4, 0(a5)
    ret