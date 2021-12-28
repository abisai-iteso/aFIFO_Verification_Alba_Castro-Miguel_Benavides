import fifo_pgk::*;

class fifo_test;

	
	virtual inFIFO dt;//interface

	valores_t q_a[$];
	valores_t var_a;
	valores_t temp = '0;
	pop_t pop_temp;
	push_t push_temp = push_t'(0);

	function new(virtual inFIFO.dataOut d);
	dt = d;
	endfunction

////////////////////////////////////////
function int qsize();
	qsize = q_a.size();
endfunction
////////////////////////////////////////
task automatic random_data();

	var_a = $random();
	dt.data_in = var_a;
	push_temp = PUSH;
	dt.push = push_temp;

	if(push_temp) q_a.push_front(var_a);
endtask


task valores_t pop_generate(); 

	pop_temp = NO_POP;
	dt.pop = pop_temp;

	if(pop_temp) temp = q_a.pop_back();
	pop_generate = temp;

endtask



endclass
