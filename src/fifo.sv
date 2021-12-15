

class fifo_test;

logic signed [31:0] q_a[$];
//
virtual inFIFO dt;//interface

function new(virtual inFIFO.datos d);
	dt = d;
endfunction


task automatic random_data(logic signed [31:0]var_a));

var_a = $random; // checar
en_push = $urandom_range(0,1);

dt.push = en_push;

if(en_push == 1'b1)begin
	if @(posedge dt.wrclk)begin

		dt.data_in    = var_a;
		q_a.push_front(var_a);
      		return(1);
 end
end 

endtask


task automatic pop_generate(); 

en_pop = $urandom_range(0,1);
dt.pop =  en_pop;

if(en_push == 1'b1)begin
	if @(posedge dt.wrclk)begin
		
		q_a.pop_back();
		return(1);
	end
end

endtask

pushc = pushc + random_data(); //checar
popc = popc + pop_generate();

dif = pushc - popc;

if (dif == 16)begin

	dt.wrclk = 0;
	dt.full = TRUE;
end else if (diff == 0)begin

	dt.rdclk = 0;
	dt.empty = TRUE;
end	
else begin

	dt.wrclk = 1;
	dt.rdclk = 1;
end	

endclass
