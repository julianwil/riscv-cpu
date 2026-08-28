SRC = rtl/*.sv

all:
	iverilog -g2012 -o test $(SRC)
