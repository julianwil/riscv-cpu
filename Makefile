SRC = rtl/*.sv

all:
	iverilog -Wall -g2012 -o test $(SRC)
