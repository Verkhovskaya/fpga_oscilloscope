for x_dist in range(11):
    for y_dist in range(11):
        if not ((x_dist == 0)&(y_dist == 0)):
            print "assign pre_calculated["+str(x_dist)+"]["+str(y_dist)+"] =",
            print "21'b" + str(bin(int((2**21)*1.0/(y_dist**2+x_dist**2)**(3/2))))[2:]+ ";"
