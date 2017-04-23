
#...<Pārējais make file>...

QEMU = qemu-arm
test: md2 test_empty test_good_data test_bad_data 

test_empty: md2
	######## Testē 0 x 0 = 0 ########
	@echo "0 0 0 0" | $(QEMU) md2 | awk '{ print "Empty #1 " ($$0 == "0 0 " ? "Ok" : "FAIL") }'
test_bad_data: md2
	######## Testē kļūdu izvadi ########
	#1# Padots par maz datu
	@echo "" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-1 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-2 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-3 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-4 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 1 1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-5 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 1 5 1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-6 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 4 4 4 4 1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #1-7 " ($$0 == 1 ? "Ok" : "FAIL") }'

	#2# Nesareizināmas matricas
	@echo "0 0 0 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #2-1 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "0 0 1 0" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #2-2 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "0 1 0 0" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #2-3 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 0 0 0" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #2-4 " ($$0 == 1 ? "Ok" : "FAIL") }'
	
	#3# Nesareizināmas matricas
	@echo "1 0 0 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #3-1 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "0 1 1 0" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #3-2 " ($$0 == 1 ? "Ok" : "FAIL") }'
	
	#4# Nesareizināmas matricas
	@echo "0 0 2 2 4 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-1 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 4 4 4 4 0 0" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-2 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 1 4 2 2 4 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-3 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 4 4 4 4 1 1 4 " | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-4 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 4 4 4 4 3 3 4 4 4 4 4 4 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-5 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "3 3 4 4 4 4 4 4 4 4 4 2 2 4 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-6 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "1 2 4 4 4 1 4 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #4-7 " ($$0 == 1 ? "Ok" : "FAIL") }'

	#5# Reizināšanas pārplūdes
	@echo "2 2 1073741824 4 4 4 2 2 2 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #5-1 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 2 4 4 4 2 2 1073741824 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #5-2 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 4 2000000000 4 4 2 2 4 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #5-3 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 4 4 4 4 2 2 4 4 4 2000000000" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #5-4 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 -1073741825 4 4 4 2 2 2 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #5-5 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 2 4 4 4 2 2 -1073741825 4 4 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #5-6 " ($$0 == 1 ? "Ok" : "FAIL") }'
	
	#6# Saskaitīšanas pārplūdes
	@echo "2 2 536870910 1 4 4 2 2 4 4 8 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-1 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 536870910 1 4 4 2 2 4 4 100 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-2 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 -1073741824 1 4 4 2 2 2 2 -1 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-3 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 -2147483648 1 4 4 2 2 1 1 -1 4" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-4 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 -2147483648 -1 1 1 2 2 1 1 1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-5 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 -2000000000 -2000000000 1 1 2 2 1 1 1 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-6 " ($$0 == 1 ? "Ok" : "FAIL") }'
	@echo "2 2 -2000000000 1 1 1 2 2 1 1 -2000000000 1" | $(QEMU) md2 > /dev/null ; echo $$? | awk '{ print "Bad-Data #6-7 " ($$0 == 1 ? "Ok" : "FAIL") }'

test_good_data: md2
	######## Testē vai strādā kā vajag ########
	@echo "1 1 1 1 1 1" | $(QEMU) md2 | awk '{ print "Good-Data #1-1 " ($$0 == "1 1 1 " ? "Ok" : "FAIL") }'
	@echo "2 2 4 4 4 4 2 2 4 4 4 4" | $(QEMU) md2 | awk '{ print "Good-Data #1-2 " ($$0 == "2 2 32 32 32 32 " ? "Ok" : "FAIL") }'
	@echo "2 4 1 2 3 4 2 2 8 1 4 3 6 2 4 5 1 5 3 7 8 1 1 6" | $(QEMU) md2 | awk '{ print "Good-Data #1-3 " ($$0 == "2 3 29 29 62 47 63 88 " ? "Ok" : "FAIL") }'
	@echo "2 4 -1 -2 -3 -4 2 2 8 1 4 3 -6 -2 -4 5 1 5 3 7 8 1 1 6" | $(QEMU) md2 | awk '{ print "Good-Data #1-4 " ($$0 == "2 3 -17 -25 -54 23 55 72 " ? "Ok" : "FAIL") }'

# Atsevišķi var šitto patestēt - ja neko nebļauj, tad viss Ok.
test_big_matrice: md2
	# Large 1# [32x2]x[2x32] reizināšana
	@$(QEMU) md2 < tests/matrice_input1.txt > tests/output.txt
	@diff -w tests/matrice_output1.txt tests/output.txt