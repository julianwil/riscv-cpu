SRC = rtl/*.sv

all:
	iverilog -g2012 rtl/*.sv
