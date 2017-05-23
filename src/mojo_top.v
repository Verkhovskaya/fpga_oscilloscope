module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy,// AVR Rx buffer full
	output camera_clock
  );


  wire rst = ~rst_n; // make reset active high
	reg [26:0] clock_2;
  assign led[6:0] = 7'b0;

  always @(posedge clk)
	clock_2 = clock_2 + 1;

  assign camera_clock = clock_2[20];
  assign led[7] = clock_2[26];


  wire [7:0] tx_data;
  wire new_tx_data;
  wire tx_busy;
  wire [7:0] rx_data;
  wire new_rx_data;

  avr_interface avr_interface (
    .clk(clk),
    .rst(rst),
    .cclk(cclk),
    .spi_miso(spi_miso),
    .spi_mosi(spi_mosi),
    .spi_sck(spi_sck),
    .spi_ss(spi_ss),
    .spi_channel(spi_channel),
    .tx(avr_rx), // FPGA tx goes to AVR rx
    .rx(avr_tx),
    .channel(4'd15), // invalid channel disables the ADC
    .new_sample(),
    .sample(),
    .sample_channel(),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .tx_block(avr_rx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data)
  );

  wire [7:0] scope_port;

  oscilloscope oscilloscope (
    .clk(clk),
    .rst(rst),
    .tx_data(tx_data),
    .new_tx_data(new_tx_data),
    .tx_busy(tx_busy),
    .rx_data(rx_data),
    .new_rx_data(new_rx_data),
	  .input_pin_0(scope_port[0]),
	  .input_pin_1(scope_port[1]),
	  .input_pin_2(scope_port[2]),
	  .input_pin_3(scope_port[3]),
	  .input_pin_4(scope_port[4]),
	  .input_pin_5(scope_port[5]),
	  .input_pin_6(scope_port[6]),
	  .input_pin_7(scope_port[7]));

  gravity_simulator gravity_simulator(
    .clock(clk),
    .reset(rst),
    .to_scope(scope_port)
    );

endmodule
