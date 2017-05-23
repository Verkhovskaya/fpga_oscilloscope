import random
import time

gravity = 8
x_size = 128
y_size = 64

output_file = open("python_comparison_output.txt", "w")


class Display:
    def __init__(self):
        self.map = []
        for y in range(y_size):
            self.map.append([" "]*x_size)

    def clear(self):
        for y in range(y_size):
            for x in range(x_size):
                self.map[y][x] = " "

    def add(self, x, y):
        self.map[y][x] = "*"

    def show(self):
        print "------"
        for line in self.map:
            print "".join(line)
        print "------"

    def save(self, output_file):
        output_file.write("-----\n")
        for line in self.map:
            output_file.write("".join(line))
            output_file.write("\n")
        output_file.write("------\n")



display = Display()


objects = []

objects.append([x,y,0,0]) #x, y, velocity_x, velocity_y
objects.append([x,y,0,0])
objects.append([x,y,0,0])
objects.append([x,y,0,0])
objects.append([x,y,0,0])
objects.append([x,y,0,0])
objects.append([x,y,0,0])
objects.append([x,y,0,0])


time1 = time.time()
data = open("python_created_data.txt")

for i in range(1000):
    for main in range(len(objects)):
        total_force_x = 0
        total_force_y = 0
        for other_object in objects:
            if other_object == objects[main]:
                continue
            distance = ((other_object[0]-objects[main][0])**2+(other_object[1]-objects[main][1])**2)**0.5
            if distance == 0:
                distance = 1
            inv_distance = 1.0/(distance**2) #To not have to calculate a division twice
            cos = (other_object[0]-objects[main][0])/distance
            sin = (other_object[1]-objects[main][1])/distance
            force_x = gravity*cos*inv_distance #Physics
            force_y = gravity*cos*inv_distance
            total_force_x += force_x
            total_force_y += force_y

        objects[main][2] += total_force_x #velocity
        objects[main][3] += total_force_y
        objects[main][0] += int(objects[main][2]) #the object moves
        objects[main][1] += int(objects[main][3])

        if (objects[main][0] >= x_size) | (objects[main][0] < 0):
            objects[main][0] -= x_size * (int(objects[main][0])/x_size) #Keep objects in the frame
            objects[main][2] = 0 #To avoid a flinging effect from skipping to the opposite side


        if (objects[main][1] >= y_size) | (objects[main][1] < 0):
            objects[main][1] -= y_size * (int(objects[main][1])/y_size) #Keep objects in the frame
            objects[main][3] = 0 #To avoid a flinging effect from skipping to the opposite side.

    display.clear()
    for each in objects:


        display.add(each[0], each[1])
        print each[2],each[3]
        #print(str(each[0]) + " " + str(each[1]) + " " + str(each[2]) + " " + str(each[3]))
    #display.show()
    if i < 100:
        None
        display.save(output_file)
        #Commented out when measuring timing

time2 = time.time()

print time2 - time1
