
`ifndef FIFO_PKG_SV
        `define FIFO_PGK_SV

package fifo_pkg;

    localparam WIDTH = 8;
    localparam  W_ADDR      = 4;
    localparam  ADDR_GRAY   = W_ADDR + 1;
    localparam  W_DEPTH     = 2**W_ADDR;
    localparam  ENB         = 1'b1;

    //typedef logic [W_DATA-1:0]        data_t;
    typedef logic [W_ADDR-1:0]        addr_t;
    typedef logic [WIDTH-1:0]         valores_t

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

