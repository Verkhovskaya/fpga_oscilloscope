module data_port (
    input clk,
    input [3:0] addr,
    output [7:0] data,
	 input input_pin
  );

  wire [7:0] rom_data [13:0];

  assign rom_data[1] = "<";
  assign rom_data[0][6:0] = 7'b0;
  assign rom_data[0][7] = input_pin;
  assign rom_data[2] = "0";
  assign rom_data[3] = "0";
  assign rom_data[4] = "0";
  assign rom_data[5] = "0";
  assign rom_data[6] = "0";
  assign rom_data[7] = "0";
  assign rom_data[8] = "0";
  assign rom_data[9] = "0";
  assign rom_data[10] = "0";
  assign rom_data[11] = "0";
  assign rom_data[12] = ">";
  assign rom_data[13] = "\n";

  reg [7:0] data_d, data_q;

  assign data = data_q;

  always @(*) begin
    if (addr > 4'd13)
      data_d = " ";
    else
      data_d = rom_data[addr];
  end

  always @(posedge clk) begin
    data_q <= data_d;
  end

endmodule
