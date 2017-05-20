module oscilloscope (
    input clk,
    input rst,
    output [7:0] tx_data,
    output reg new_tx_data,
    input tx_busy,
    input [7:0] rx_data,
    input new_rx_data,
    input input_pin_0,
	 input input_pin_1,
   input input_pin_2,
   input input_pin_3,
   input input_pin_4,
   input input_pin_5,
   input input_pin_6,
   input input_pin_7);

  localparam STATE_SIZE = 1;
  localparam IDLE = 0,
    PRINT_MESSAGE = 1;

  localparam MESSAGE_LEN = 1;

  reg [STATE_SIZE-1:0] state_d, state_q;

  reg [3:0] addr_d, addr_q;

  data_port data_port (
  .clk(clk),
  .data_out(tx_data),
  .input_pin_0(input_pin_0),
 .input_pin_1(input_pin_1),
 .input_pin_2(input_pin_2),
 .input_pin_3(input_pin_3),
 .input_pin_4(input_pin_4),
 .input_pin_5(input_pin_5),
 .input_pin_6(input_pin_6),
 .input_pin_7(input_pin_7)
  );

  always @(*) begin
    state_d = state_q; // default values
    addr_d = addr_q;   // needed to prevent latches
    new_tx_data = 1'b0;

    case (state_q)
      IDLE: begin
        addr_d = 4'd0;
        if (new_rx_data && rx_data == "h")
          state_d = PRINT_MESSAGE;
      end
      PRINT_MESSAGE: begin
        if (!tx_busy) begin
          new_tx_data = 1'b1;
          addr_d = addr_q + 1'b1;
          if (addr_q == MESSAGE_LEN-1)
            state_d = IDLE;
        end
      end
      default: state_d = IDLE;
    endcase
  end

  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
    end else begin
      state_q <= state_d;
    end

    addr_q <= addr_d;
  end

endmodule
