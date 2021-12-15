

interface inFIFO(input clk);

import fifo_pkg::*;	

	logic wr_rst,
	logic rd_rst,
	logic wrclk,
	logic rdclk,
	push_t push,
	pop_t pop,
	valores_t data_in,
        valores_t data_out,
	logic full, 
	logic empty

modport datosIn(

	input wr_rst,
	input rd_rst,
	input wrclk,
	input rdclk,
	input push,
	input pop,
	input data_in,
	output data_out,
	output full, 
	output empty 
);


modport datosOut(
	output wr_rst,
	output rd_rst,
	output wrclk,
	output rdclk,
	output push,
	output pop,
	output data_in,
	input data_out,
	input full, 
	input empty 
);

endinterface
