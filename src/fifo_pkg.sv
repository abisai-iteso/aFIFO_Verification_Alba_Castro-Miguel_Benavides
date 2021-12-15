
`ifndef FIFO_PKG_SV
	`define FIFO_PGK_SV

package fifo_pkg;

	localparam WIDTH = 8;



	typedef logic [WIDTH-1:0] valores_t
	typedef enum logic {
		NOPOP = 0,
		POP = 1
	} pop_t
	typedef enum logic {
		NOPUSH = 0,
		PUSH = 1
	} push_t

endpackage	
`endif	
