L0 : lui $1,0x1000
     ori $1,$1,0x1008
     sw  $1,0($0)
     lui $1,0x1000
     ori $1,$1,0x1002
     sw  $1,4($0)
     lui $1,0x8000
     ori $1,$1,0x1001
     sw  $1,8($0)
     lui $1,0x1000
     ori $1,$1,0x1005
     sw  $1,12($0)
     lui $1,0x8000
     ori $1,$1,0x1000
     sw  $1,16($0)
     lui $1,0xffff
     ori $1,$1,0x8000
     sw  $1,20($0)#L0存放完数据。取1号作为slt的结果寄存器。2号寄存器作为当前的最大值，3号寄存器作为当前的比较量，.5号决定本轮的进展,6号存最大的存储器序号
     jal L1
     lw $1,36($0)
    sw $1,0($0)
   lw $1,40($0)
       sw $1,4($0)
     lw $1,44($0)
    sw $1,8($0)
     lw $1,48($0)
     sw $1,12($0)
    lw $1,52($0)
     sw $1,16($0)
     lw $1,56($0)
     sw $1,20($0)
     j L7
     #j L7#结束
#L1进行外层循环的初始化，使4号寄存器存储当前完成比较的数的个数
L1:  lui $4,0x0000
#L2进行外层循环判断
L2: slti $1,$4,24#这里要打个问号。
    bne  $1,$0,L3
    jr $ra
#L3进行内层循环初始化
L3: lw $2,0($0)
    lui $5,0
    addi $5,$5,4
#L4进行内层循环的判断
L4: slti $1,$5,24
    bne  $1,$0,L5
    addi $4,$4,4
    ori $25,$25,0x80000001
    sw $25,0($6)
    sw $2,32($4)
    j L2
L5: lw $3,0($5)
    slt $1,$2,$3
    bne $1,$0,L6
    addi $5,$5,4
    j L4
L6: add $2,$3,$0
    add $6,$5,$0
    addi $5,$5,4
    j L4
L7: