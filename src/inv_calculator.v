module inv_calculator (
  input [6:0] x_dist,
  input [5:0] y_dist,
  output [19:0] inv_distance_cube);



  reg [19:0] output_buffer;
  assign inv_distance_cube = output_buffer;

  wire [19:0] pre_calculated [10:0][10:0];

  assign pre_calculated[0][0] = 20'b0; //ignores itself

  assign pre_calculated[0][1] = 20'b11111111111111111111;
  assign pre_calculated[0][2] = 20'b11111111111111111111;
  assign pre_calculated[0][3] = 20'b111000111000111000;
  assign pre_calculated[0][4] = 20'b100000000000000000;
  assign pre_calculated[0][5] = 20'b10100011110101110;
  assign pre_calculated[0][6] = 20'b1110001110001110;
  assign pre_calculated[0][7] = 20'b1010011100101111;
  assign pre_calculated[0][8] = 20'b1000000000000000;
  assign pre_calculated[0][9] = 20'b110010100100010;
  assign pre_calculated[0][10] = 20'b101000111101011;
  assign pre_calculated[1][0] = 20'b11111111111111111111;
  assign pre_calculated[1][1] = 20'b11111111111111111111;
  assign pre_calculated[1][2] = 20'b1100110011001100110;
  assign pre_calculated[1][3] = 20'b110011001100110011;
  assign pre_calculated[1][4] = 20'b11110000111100001;
  assign pre_calculated[1][5] = 20'b10011101100010011;
  assign pre_calculated[1][6] = 20'b1101110101100111;
  assign pre_calculated[1][7] = 20'b1010001111010111;
  assign pre_calculated[1][8] = 20'b111111000000111;
  assign pre_calculated[1][9] = 20'b110001111100111;
  assign pre_calculated[1][10] = 20'b101000100011011;
  assign pre_calculated[2][0] = 20'b10000000000000000000;
  assign pre_calculated[2][1] = 20'b1100110011001100110;
  assign pre_calculated[2][2] = 20'b1000000000000000000;
  assign pre_calculated[2][3] = 20'b100111011000100111;
  assign pre_calculated[2][4] = 20'b11001100110011001;
  assign pre_calculated[2][5] = 20'b10001101001111011;
  assign pre_calculated[2][6] = 20'b1100110011001100;
  assign pre_calculated[2][7] = 20'b1001101010010000;
  assign pre_calculated[2][8] = 20'b111100001111000;
  assign pre_calculated[2][9] = 20'b110000001100000;
  assign pre_calculated[2][10] = 20'b100111011000100;
  assign pre_calculated[3][0] = 20'b111000111000111000;
  assign pre_calculated[3][1] = 20'b110011001100110011;
  assign pre_calculated[3][2] = 20'b100111011000100111;
  assign pre_calculated[3][3] = 20'b11100011100011100;
  assign pre_calculated[3][4] = 20'b10100011110101110;
  assign pre_calculated[3][5] = 20'b1111000011110000;
  assign pre_calculated[3][6] = 20'b1011011000001011;
  assign pre_calculated[3][7] = 20'b1000110100111101;
  assign pre_calculated[3][8] = 20'b111000000111000;
  assign pre_calculated[3][9] = 20'b101101100000101;
  assign pre_calculated[3][10] = 20'b100101100100111;
  assign pre_calculated[4][0] = 20'b100000000000000000;
  assign pre_calculated[4][1] = 20'b11110000111100001;
  assign pre_calculated[4][2] = 20'b11001100110011001;
  assign pre_calculated[4][3] = 20'b10100011110101110;
  assign pre_calculated[4][4] = 20'b10000000000000000;
  assign pre_calculated[4][5] = 20'b1100011111001110;
  assign pre_calculated[4][6] = 20'b1001110110001001;
  assign pre_calculated[4][7] = 20'b111111000000111;
  assign pre_calculated[4][8] = 20'b110011001100110;
  assign pre_calculated[4][9] = 20'b101010001110100;
  assign pre_calculated[4][10] = 20'b100011010011110;
  assign pre_calculated[5][0] = 20'b10100011110101110;
  assign pre_calculated[5][1] = 20'b10011101100010011;
  assign pre_calculated[5][2] = 20'b10001101001111011;
  assign pre_calculated[5][3] = 20'b1111000011110000;
  assign pre_calculated[5][4] = 20'b1100011111001110;
  assign pre_calculated[5][5] = 20'b1010001111010111;
  assign pre_calculated[5][6] = 20'b1000011001001011;
  assign pre_calculated[5][7] = 20'b110111010110011;
  assign pre_calculated[5][8] = 20'b101110000001011;
  assign pre_calculated[5][9] = 20'b100110101001000;
  assign pre_calculated[5][10] = 20'b100000110001001;
  assign pre_calculated[6][0] = 20'b1110001110001110;
  assign pre_calculated[6][1] = 20'b1101110101100111;
  assign pre_calculated[6][2] = 20'b1100110011001100;
  assign pre_calculated[6][3] = 20'b1011011000001011;
  assign pre_calculated[6][4] = 20'b1001110110001001;
  assign pre_calculated[6][5] = 20'b1000011001001011;
  assign pre_calculated[6][6] = 20'b111000111000111;
  assign pre_calculated[6][7] = 20'b110000001100000;
  assign pre_calculated[6][8] = 20'b101000111101011;
  assign pre_calculated[6][9] = 20'b100011000000100;
  assign pre_calculated[6][10] = 20'b11110000111100;
  assign pre_calculated[7][0] = 20'b1010011100101111;
  assign pre_calculated[7][1] = 20'b1010001111010111;
  assign pre_calculated[7][2] = 20'b1001101010010000;
  assign pre_calculated[7][3] = 20'b1000110100111101;
  assign pre_calculated[7][4] = 20'b111111000000111;
  assign pre_calculated[7][5] = 20'b110111010110011;
  assign pre_calculated[7][6] = 20'b110000001100000;
  assign pre_calculated[7][7] = 20'b101001110010111;
  assign pre_calculated[7][8] = 20'b100100001111110;
  assign pre_calculated[7][9] = 20'b11111100000011;
  assign pre_calculated[7][10] = 20'b11011011111010;
  assign pre_calculated[8][0] = 20'b1000000000000000;
  assign pre_calculated[8][1] = 20'b111111000000111;
  assign pre_calculated[8][2] = 20'b111100001111000;
  assign pre_calculated[8][3] = 20'b111000000111000;
  assign pre_calculated[8][4] = 20'b110011001100110;
  assign pre_calculated[8][5] = 20'b101110000001011;
  assign pre_calculated[8][6] = 20'b101000111101011;
  assign pre_calculated[8][7] = 20'b100100001111110;
  assign pre_calculated[8][8] = 20'b100000000000000;
  assign pre_calculated[8][9] = 20'b11100001111111;
  assign pre_calculated[8][10] = 20'b11000111110011;
  assign pre_calculated[9][0] = 20'b110010100100010;
  assign pre_calculated[9][1] = 20'b110001111100111;
  assign pre_calculated[9][2] = 20'b110000001100000;
  assign pre_calculated[9][3] = 20'b101101100000101;
  assign pre_calculated[9][4] = 20'b101010001110100;
  assign pre_calculated[9][5] = 20'b100110101001000;
  assign pre_calculated[9][6] = 20'b100011000000100;
  assign pre_calculated[9][7] = 20'b11111100000011;
  assign pre_calculated[9][8] = 20'b11100001111111;
  assign pre_calculated[9][9] = 20'b11001010010001;
  assign pre_calculated[9][10] = 20'b10110101000010;
  assign pre_calculated[10][0] = 20'b101000111101011;
  assign pre_calculated[10][1] = 20'b101000100011011;
  assign pre_calculated[10][2] = 20'b100111011000100;
  assign pre_calculated[10][3] = 20'b100101100100111;
  assign pre_calculated[10][4] = 20'b100011010011110;
  assign pre_calculated[10][5] = 20'b100000110001001;
  assign pre_calculated[10][6] = 20'b11110000111100;
  assign pre_calculated[10][7] = 20'b11011011111010;
  assign pre_calculated[10][8] = 20'b11000111110011;
  assign pre_calculated[10][9] = 20'b10110101000010;
  assign pre_calculated[10][10] = 20'b10100011110101;

  always @(*) begin
    if ((x_dist>20'b1011)|(y_dist>20'b1011))
      output_buffer = 20'b0;
    else
      output_buffer = pre_calculated[x_dist][y_dist];
  end
endmodule
