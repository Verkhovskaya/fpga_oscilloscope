module gravity_simulator (
  output [7:0] to_scope,
  input clock,
  input reset);

  //register bank
  reg [6:0] x_pos_all [7:0];
  reg [5:0] y_pos_all [7:0];
  reg [13:0] x_vel_all [7:0]; //5.8, signed
  reg [13:0] y_vel_all [7:0]; //5.8, signed



  reg [26:0] clock_counter;
  reg [2:0] object_select;


  always @(posedge clock) begin
		if (reset) begin
			clock_counter = 27'b0;
			object_select = 3'b0;
      x_pos_all[0] = 7'd10;
      y_pos_all[0] = 6'd10;
      x_pos_all[1] = 7'd10;
      y_pos_all[1] = 6'd20;
      x_pos_all[2] = 7'd20;
      y_pos_all[2] = 6'd20;
      x_pos_all[3] = 7'd20;
      y_pos_all[3] = 6'd10;
      x_pos_all[4] = 7'd50;
      y_pos_all[4] = 6'd50;
      x_pos_all[5] = 7'd30;
      y_pos_all[5] = 6'd30;
      x_pos_all[6] = 7'd40;
      y_pos_all[6] = 6'd40;
      x_pos_all[7] = 7'd40;
      y_pos_all[7] = 6'd50;

      x_vel_all[0] = 14'b0;
      y_vel_all[0] = 14'b0;
      x_vel_all[1] = 14'b0;
      y_vel_all[1] = 14'b0;
      x_vel_all[2] = 14'b0;
      y_vel_all[2] = 14'b0;
      x_vel_all[3] = 14'b0;
      y_vel_all[3] = 14'b0;
      x_vel_all[4] = 14'b0;
      y_vel_all[4] = 14'b0;
      x_vel_all[5] = 14'b0;
      y_vel_all[5] = 14'b0;
      x_vel_all[6] = 14'b0;
      y_vel_all[6] = 14'b0;
      x_vel_all[7] = 14'b0;
      y_vel_all[7] = 14'b0;
		end
		else begin
			clock_counter = clock_counter + 1;
			if (clock_counter[22:0] == 23'b0) begin
        x_pos_all[object_select] = new_x_position;
        y_pos_all[object_select] = new_y_position;
        x_vel_all[object_select] = new_x_velocity;
        y_vel_all[object_select] = new_y_velocity;
				object_select = object_select + 1;
			end
		end
	end


  wire [6:0] x_pos_object;
  wire [5:0] y_pos_object;
  wire [13:0] x_vel_object;
  wire [13:0] y_vel_object;

  assign x_pos_object = x_pos_all[object_select];
  assign y_pos_object = y_pos_all[object_select];
  assign x_vel_object = x_vel_all[object_select];
  assign y_vel_object = y_vel_all[object_select];

  wire [6:0] x_pos_0;
  wire [6:0] x_pos_1;
  wire [6:0] x_pos_2;
  wire [6:0] x_pos_3;
  wire [6:0] x_pos_4;
  wire [6:0] x_pos_5;
  wire [6:0] x_pos_6;
  wire [6:0] x_pos_7;

  assign x_pos_0 = x_pos_all[0];
  assign x_pos_1 = x_pos_all[1];
  assign x_pos_2 = x_pos_all[2];
  assign x_pos_3 = x_pos_all[3];
  assign x_pos_4 = x_pos_all[4];
  assign x_pos_5 = x_pos_all[5];
  assign x_pos_6 = x_pos_all[6];
  assign x_pos_7 = x_pos_all[7];

  wire [5:0] y_pos_0;
  wire [5:0] y_pos_1;
  wire [5:0] y_pos_2;
  wire [5:0] y_pos_3;
  wire [5:0] y_pos_4;
  wire [5:0] y_pos_5;
  wire [5:0] y_pos_6;
  wire [5:0] y_pos_7;

  assign y_pos_0 = y_pos_all[0];
  assign y_pos_1 = y_pos_all[1];
  assign y_pos_2 = y_pos_all[2];
  assign y_pos_3 = y_pos_all[3];
  assign y_pos_4 = y_pos_all[4];
  assign y_pos_5 = y_pos_all[5];
  assign y_pos_6 = y_pos_all[6];
  assign y_pos_7 = y_pos_all[7];

  wire [13:0] x_force_0;
  wire [13:0] x_force_1;
  wire [13:0] x_force_2;
  wire [13:0] x_force_3;
  wire [13:0] x_force_4;
  wire [13:0] x_force_5;
  wire [13:0] x_force_6;
  wire [13:0] x_force_7;

  wire [13:0] y_force_0;
  wire [13:0] y_force_1;
  wire [13:0] y_force_2;
  wire [13:0] y_force_3;
  wire [13:0] y_force_4;
  wire [13:0] y_force_5;
  wire [13:0] y_force_6;
  wire [13:0] y_force_7;

  force_calculator force_calculator_0 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_0),
    .y_pos_other(y_pos_0),
    .x_force(x_force_0),
    .y_force(y_force_0)
    );

  force_calculator force_calculator_1 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_1),
    .y_pos_other(y_pos_1),
    .x_force(x_force_1),
    .y_force(y_force_1)
    );

  force_calculator force_calculator_2 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_2),
    .y_pos_other(y_pos_2),
    .x_force(x_force_2),
    .y_force(y_force_2)
    );

  force_calculator force_calculator_3 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_3),
    .y_pos_other(y_pos_3),
    .x_force(x_force_3),
    .y_force(y_force_3)
    );

  force_calculator force_calculator_4 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_4),
    .y_pos_other(y_pos_4),
    .x_force(x_force_4),
    .y_force(y_force_4)
    );

  force_calculator force_calculator_5 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_5),
    .y_pos_other(y_pos_5),
    .x_force(x_force_5),
    .y_force(y_force_5)
    );

  force_calculator force_calculator_6 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_6),
    .y_pos_other(y_pos_6),
    .x_force(x_force_6),
    .y_force(y_force_6)
    );

  force_calculator force_calculator_7 (
    .x_pos_object(x_pos_object),
    .y_pos_object(y_pos_object),
    .x_pos_other(x_pos_7),
    .y_pos_other(y_pos_7),
    .x_force(x_force_7),
    .y_force(y_force_7)
    );

  wire [13:0] x_total_force; //5.8, signed
  wire [13:0] y_total_force;

  assign x_total_force =
  x_force_0 + x_force_1 + x_force_2 + x_force_3 +
  x_force_4 + x_force_5 + x_force_6 + x_force_7;

  assign y_total_force =
  y_force_0 + y_force_1 + y_force_2 + y_force_3 +
  y_force_4 + y_force_5 + y_force_6 + y_force_7;

  wire [13:0] new_x_velocity; //5.8, signed
  wire [13:0] new_y_velocity;

  assign new_x_velocity = x_vel_object+x_total_force;
  assign new_y_velocity = y_vel_object+y_total_force;

  reg [6:0] new_x_position;
  reg [5:0] new_y_position;

  always @(*) begin
    if (new_x_velocity[13] == 1'b0)
      new_x_position = x_pos_object + {3'b000, x_vel_object[12:10]};
    else
      new_x_position = x_pos_object + {2'b11, x_vel_object[13:10]};
  end

  always @(*) begin
    if (new_y_velocity[13] == 1'b0)
      new_y_position = y_pos_object + {3'b000, y_vel_object[12:10]};
    else
      new_y_position = y_pos_object + {2'b11, y_vel_object[13:10]};
  end

  reg [7:0] to_scope_reg;
  assign to_scope = to_scope_reg;


  always @(posedge clock) begin
    if (clock_counter[22:20] == 3'b000)
      to_scope_reg = 8'b11111111;
    else if (clock_counter[22:20] == 3'b001)
      to_scope_reg = {5'b0, object_select};
    else if (clock_counter[22:20] == 3'b010)
      to_scope_reg = 8'b11111111;
    else if (clock_counter[22:20] == 3'b011)
      to_scope_reg = 8'b11111111;
    else if (clock_counter[22:20] == 3'b100)
      to_scope_reg = 8'b11111111;
    else if (clock_counter[22:20] == 3'b101)
      to_scope_reg = 8'b11111111;
    else if (clock_counter[22:20] == 3'b110)f
      to_scope_reg = {2'b0, y_pos_object};
    else if (clock_counter[22:20] == 3'b111)
      to_scope_reg = {1'b0, x_pos_object};
  end


endmodule
