module force_calculator (
  //gravity = 8, or left shift 3.
  input [6:0] x_pos_object,
  input [6:0] x_pos_other,
  input [5:0] y_pos_object,
  input [5:0] y_pos_other,
  //The gravitational constant is taken to be 8.
  output [13:0] x_force, //5.8, signed
  output [13:0] y_force); //5.8, signed

  reg [6:0] x_dist;
  reg [5:0] y_dist;
  wire x_sign;
  wire y_sign;

  always @(*) begin
    if ({1'b0,x_pos_object} > {1'b0, x_pos_other})
      x_dist = x_pos_object-x_pos_other;
    else
      x_dist = x_pos_other-x_pos_object;
  end

  always @(*) begin
    if ({1'b0,y_pos_object} > {0,y_pos_other})
      y_dist = y_pos_object - y_pos_other;
    else
      y_dist = y_pos_other - y_pos_object;
  end

  wire [19:0] inv_distance_cube; //0.20, unsigned.

  inv_calculator inv_calculator(
    .x_dist(x_dist),
    .y_dist(y_dist),
    .inv_distance_cube(inv_distance_cube)
    );

  //inv distance cubed is 16 bits wide
  //x_dist is 7 wide, y_dist is 6 bits wide
  //so the result of the multiplication is 7.16 unsigned for x, 6.16 unsigned for y
  //Gravity (8) adds a left shift of 3
  //So the multiplication of x_dist*inv_distance_cube is 10.17, unsigned, 9.17 for y.
  //The highest force possible though is 8 (when two planets are 1 away from each other, since the overlap case is ignored)
  //So you can shorten that down to 3.13 unsigned for x, 3.13 unsigned for y.
  //And make it accurate to the nearest 2^1/256. so .8
  //So in the end, we get:

  wire [10:0] abs_force_x; //3.8, unsigned
  wire [10:0] abs_force_y; //3.8, unsigned
  wire [26:0] calculation_result_x = (x_dist*inv_distance_cube);
  wire [25:0] calculation_result_y = (y_dist*inv_distance_cube);
  assign abs_force_x = calculation_result_x[19:9];
  assign abs_force_y = calculation_result_y[19:9];

  //Make this a bit bigger and add a sign to allow for adding all the forces later
  reg [13:0] y_force_reg; //5.8, signed
  reg [13:0] x_force_reg; //5.8, signed
  assign y_force = y_force_reg; //5.8, signed
  assign x_force = x_force_reg; //5.8, signed

  always @(*) begin
    if ({1'b0,x_pos_object} > {1'b0, x_pos_other})
      x_force_reg = {3'b0, abs_force_x};
    else
      x_force_reg = -{3'b0, abs_force_x};
  end

  always @(*) begin
    if ({1'b0,y_pos_object} > {0,y_pos_other})
      y_force_reg = {3'b0, abs_force_y};
    else
      y_force_reg = -{3'b0, abs_force_y};
  end

endmodule
