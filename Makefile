SRC = rtl/*.sv tb/*.sv

all:
	iverilog -Wall -g2012 -o test $(SRC)
