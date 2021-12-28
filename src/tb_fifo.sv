`timescale 1ns / 1ns  

module tb_fifo();

include "fifo_test.svh"; 

	import fifo_pgk::*;
	
	bit clk_wr = 0;
	bit rst_wr;
	bit clk_rd = 0;
	bit rst_rd;

	fifo f; 
           
	//instacia de la interface
	inFIFO itf();

	fifo_top uut (
	
		.wr_clk(clk_wr),
		.wr_rst(rst_wr),
		.rd_clk(clk_rd),
		.rd_rst(rst_rd),
		.itf   (itf.fifoIn)
	);

	/*wrapper_fifo dut(
		
		.wrclk(clk),
		.rdclk(clk),
		.wrrst(rst),
		.rdrst(rst),
		.push(dt.),//drivear tipo de dato de la if
		.full(dt.),
		.data_in(dt.),
		.pop(dt.),
		.empty(dt.),
		.data_out(dt.)
	);
*/

///////////////////////////////////////////
initial begin
	fork
		forever #5 clk_wr = ~clk_wr;
		forever #7 clk_rd = ~clk_rd;
	join		
end
//////////////////////////////////////////
task overflow (input int q_size);
	if(q_size <= 16)begin
		for(integer i=q_size; i<=16; i++)begin
			f.random_data(); 	
		end
	end
endtask
//////////////////////////////////////////////////////////////
task underflow (input int q_size);
	valores_t pop; //revisar tipo de dato
	if (q_size > 0)begin
		for(integer j=q_size; j>=0; j--)begin
			pop = f.pop_generate();
		end
	end
endtask	
/////////////////////////////////////////////////////////////

task monitor ();
	if(f.pop_generate != itf.data_out)begin
		$display("Time: %t, Error: Expected %d, Obteined %d", $time, f.pop_generate, itf.data_out);
		$stop(2)
	end
endtask
/////////////////////////////////////////////////////////////

initial begin

	rst_wr = 1; rst_rd = 1;
#1	rst_wr = 0; rst_rd = 0;
#5	rst_wr = 1; rst_rd = 1;

	f = new(itf);//rev
	#5 
	fork
	f.random_data();
	f.pop_generate();//
	overflow(f.qsize);//
	underfloe(f.qsize);//
	monitor();
	join


	#1000 $stop(2)
end

endmodule
	
