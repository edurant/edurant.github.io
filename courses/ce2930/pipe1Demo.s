# FILENAME: pipe1Demo.s	BY: durant@msoe.edu	 BEGAN: 22 April 2009
# $Id: pipe1Demo.s,v 1.3 2010/05/09 14:07:52 durant Exp durant $
# PROVIDES:  CE2930 test program for the pipelined-cycle processor

# no need to implement slt* for the pipelined processor
# implemented instructions, arithmetic/logic,
# R-format: add  addu  and  nor or  sll srl sub subu
# I-format: addi addiu andi     ori 
# branch,   I-format: beq bne
# transfer, I-format: lw sw

# demo procedure
# 1. assemble and test in a simulator (use MARS for correct branch offsets)
# 2. if bugs exist, correct and document on cover sheet, o.w. indicate no bugs exist
# 3. simulate in Quartus, including internal signals as needed
# 4. identify key results in the simulation and show to professor

# scoring if your demo doesn't work
# you can't demo on the due date: -10% first day, -5% each additional weekday

	.text	# Executable code section
main:		# User program entry point

	ori $t0,$zero,0x5AC3	# 3408 5ac3
	andi $t1,$zero,0x5AC4	# 3009 5ac4 after if, ori is id
	add $zero,$zero,$zero	# 0000 0020 after if, ori is ex
	add $zero,$zero,$zero	# 0000 0020 after if, ori is mem
	add $zero,$zero,$zero	# 0000 0020 after if, ori is wb
	beq $t0,$zero,L1	# 1100 0002 branch will fail, predict not taken
				# is successful; andi is wb
	bne $t0,$t1,L1		# 1509 0001 branch will succeed, need to flush
	beq $zero,$zero,main	# 1000 fff8 should never reach this branch
# now, illustrate the data hazards which have not yet been resolved
L1:	add $t1,$t1,-1		# 2129 ffff add1, enters pipeline after successful bne flush
	add $t1,$t1,-1		# 2129 ffff add2, add1 is id
	add $t1,$t1,-1		# 2129 ffff add3, add1 is ex
	add $t1,$t1,-1		# 2129 ffff add4, add1 is mem
	add $t1,$t1,-1		# 2129 ffff add5, add1 is wb
	add $t1,$t1,-1		# 2129 ffff add6, add2 is wb -- show that add1's
				# wb value is found by add6's id
END:	beq $zero,$zero,END	# 1000 ffff

# END OF PROGRAM
