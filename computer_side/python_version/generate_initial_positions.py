print("reg [object_number_m1:0] pos_x [6:0];")
print("reg [object_number_m1:0] pos_y [5:0];")

objects = [
    [0,0],
    [127,63]
]

for object_id in range(len(objects)):
    x_position = "{0:b}".format(objects[object_id][0])
    x_position = "0"*(7-len(x_position))+x_position
    y_position = "{0:b}".format(objects[object_id][1])
    y_position = "0"*(6-len(y_position))+y_position

    print "assign pos_x [" + str(object_id) + "] = 7'b" + x_position + ";"
    print "assign pos_y [" + str(object_id) + "] = 6'b" + y_position + ";"
