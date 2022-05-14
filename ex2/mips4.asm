.data
	array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
.text
	main:
		la $a0, array			# $a0: address of array
		addi $a1, $0, 10		# $a1: size of array
		jal sum
		
		# print sum
		move $a0, $v0
		li $v0, 1
		syscall
		
		# exit
		li $v0, 10
		syscall
sum:
		sub $sp, $sp, 12
		sw $ra, ($sp)
		sw $s0, 4($sp)	# $s0 = v
		sw $s1, 8($sp)	# $s1 = k (old)
				
		lw $v0, ($a0)	# returnValue = v[0]
		beq $a1, 1, sumDone
		
		# save v, k
		move $s0, $a0	# $s0 = v
		move $s1, $a1	# $s1 = k
		
		# sum(&v[1], k-1)
		addi $a0, $a0, 4	   # $a0 = &v[1]
		subi $a1, $a1, 1    # $a1 = k - 1
		jal sum	# $v0 = sum(&v[1], k-1)
		
		# return v[0] + sum(&v[1], k-1)
		lw $t0, ($s0)		# $t0 = v[0]
		add $v0, $t0, $v0	# returnValue = v[0] + sum(&v[1], k-1)
sumDone:
		lw $ra, ($sp)
		lw $s0, 4($sp)
		lw $t1, 8($sp)
		addi $sp, $sp, 12
		jr $ra