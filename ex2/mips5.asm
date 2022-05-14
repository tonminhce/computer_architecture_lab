.data
	ar: .word 1, 5, 7, -10, 2, 9, 30, 100, 76, -5
.text
	main:
		la $a0, ar			# $a0 = ar
		addi $a1, $0, 10		# $a1 = 10
		jal max
		
		# print result
		move $a0, $v0
		li $v0, 1
		syscall
		
		# exit
		li $v0, 10
		syscall
		
	max:
		# store to stack
		sub $sp, $sp, 12
		sw $ra, ($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)

		# base case
		lw $v0, ($a0)
		beq $a1, 1, maxDone
			
		# save v, k
		move $s0, $a0	# $s0 = v
		move $s1, $a1	# $s1 = k
		
		# max(&v[1], k - 1)
		addi $a0, $a0, 4	
		subi $a1, $a1, 1
		jal max	# $v0 = max(&v[1], k - 1)
		
		move $t0, $v0		# $t0 = temp
		lw $t1, ($s0)		# $t1 = v[0]
		sge $t2, $t1, $t0 	# $t2 = v[0] >= temp
		
		# if (v[0] >= temp) return v[0];
		# else return temp;
		beq $t2, 0, else
			move $v0, $t1
			
			j endif
		else:
			move $v0, $t0
			
		endif:
		
	maxDone:
		# restore
		add $sp, $sp, 12
		lw $ra, ($sp)
		lw $s0, 4($sp)
		lw $s1, 8($sp)
		
		jr $ra
		
		
		
		
		
		
