.data
	error: .asciiz "Not a positive number"
	legit: .asciiz "Legit number and the fibonacci numbers are: "
.text
main:
	# read input
	li $v0, 5
	syscall
	# $t0 = n
	move $t0, $v0
	
	# if (n > 0) {...run} else {...error}
		sgt $t1, $t0, $0
		beq $t1, $0, else
		la $a0, legit
		li $v0, 4
		syscall
		# print fibonacci numbers
		li $t1, 0	# $t1 = f1
		li $t2, 1	# $t2 = f2
		li $t3, 1	# $t3 = i
		li $t4, ' ' # $t4 = ' '
		
		# cout << f1 << ' ';
		move $a0, $t1
		li $v0, 1
		syscall
		
		move $a0, $t4
		li $v0, 11
		syscall
		
		# for (i = 1; i != n; i++)
		loop:
		
			beq $t3, $t0, exit
			
			# cout << f2 << ' ';
			move $a0, $t2
			li $v0, 1
			syscall
			
			move $a0, $t4
			li $v0, 11
			syscall
			
			# $t5 = next
			add $t5, $t1, $t2
			move $t1, $t2
			move $t2, $t5
			
			# i++
			addi $t3, $t3, 1
			
			j loop
		
	exit:
		j endif
	
	else:
		la $a0, error
		li $v0, 4
		syscall
	
	endif:
	# exit
	li $v0, 10
	syscall