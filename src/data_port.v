module data_port (
    input clk,
    output [7:0] data_out,
    input input_pin_0,
  	 input input_pin_1,
    input input_pin_2,
    input input_pin_3,
    input input_pin_4,
    input input_pin_5,
    input input_pin_6,
    input input_pin_7);

  wire [7:0] data;

  assign data[0] = input_pin_0;
  assign data[1] = input_pin_1;
  assign data[2] = input_pin_2;
  assign data[3] = input_pin_3;
  assign data[4] = input_pin_4;
  assign data[5] = input_pin_5;
  assign data[6] = input_pin_6;
  assign data[7] = input_pin_7;

   reg [7:0] data_q;
	assign data_out = data_q;
	
  always @(posedge clk) begin
    data_q <= data;
  end

endmodule
