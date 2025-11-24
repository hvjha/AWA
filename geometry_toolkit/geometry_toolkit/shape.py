#geometry_toolkit/shapes.py

import math
def rectangle_area(length,width):
    return length * width

def rectangle_perimeter(length,width):
    return 2 * (length + width)

def rectangle_diagonal(length,width):
    return math.sqrt(length**2 + width**2)

def square_area(length):
    return length**2

def square_perimeter(length):
    return 4 * length

def square_diagonal(length):
    return length*math.sqrt(2)

def triangle_area_simple(base,height):
    return 1/2 * base * height

def triangle_perimeter(side1,side2,side3):
    return side1+side2+side3

def triangle_area_herons(side1,side2,side3):
    s = (side1+side2+side3)/2
    return math.sqrt(s*(s-side1)*(s-side2)*(s-side3))

def equiletral_triangle_area(side):
    return (math.sqrt(3)/4)*side**2

def equiletral_triangle_perimeter(side):
    return 3*side

def equiletral_triangle_height(side):
    return (math.sqrt(3)/2)*side

def parellelogram_area(base,height):
    return base * height

def parellelogram_perimeter(base,height):
    return 2* (base + height)

#d1,d2 diagonals
def rhombus_area_diagonal(d1,d2):
    return 1/2 * d1 * d2

def rhombus_area_height(side, height):
    return side * height

def rhombus_perimeter(side):
    return 4 * side

#Here a,b are two parallel side
def trapezium_area(a,b,h):
    return 1/2 * (a+b) * h

def circle_area(radius):
    return math.pi * radius**2

def circle_circumference(radius):
    return 2 * math.pi * radius

def semicircle_area(radius):
    return 1/2 * math.pi * radius**2

def semicircle_perimeter(radius):
    return math.pi* radius + 2 * radius

def arc_length(radius,theta):
    return (theta/360) * 2 * math.pi * radius

def sector_area(radius,theta):
    return (theta/360) * math.pi * radius**2

def cube_volume(side):
    return side ** 3

#tsa (total surface area)
def cube_tsa(side):
    return 6 * side**2

#lsa (lateral surface area)
def cube_lsa(side):
    return 4 * side**2

def cube_diagonal(side):
    return side * math.sqrt(3)

# l = length b = breadth h = height
def cuboid_volume(l, b, h):
    return l * b * h

#tsa (total surface area)
def cuboid_tsa(l, b, h):
    return 2 * (l*b + b*h + h*l)

#lsa (lateral surface area)
def cuboid_lsa(l, b, h):
    return 2 * h * (l + b)

def cuboid_diagonal(l, b, h):
    return math.sqrt(l**2 + b**2 + h**2)


def cylinder_volume(radius, height):
    return math.pi * radius**2 * height

#csa (curved surface area)
def cylinder_csa(radius, height):
    return 2 * math.pi * radius * height

#tsa (total surface area)
def cylinder_tsa(radius, height):
    return 2 * math.pi * radius * (radius + height)

def cone_slant_height(radius, height):
    return math.sqrt(radius**2 + height**2)

def cone_volume(radius, height):
    return (1/3) * math.pi * radius**2 * height

#csa (curved surface area)
def cone_csa(radius, height):
    l = cone_slant_height(radius, height)
    return math.pi * radius * l

#tsa (total surface area)
def cone_tsa(radius, height):
    l = cone_slant_height(radius, height)
    return math.pi * radius * (radius + l)

def sphere_volume(radius):
    return (4/3) * math.pi * radius**3

def sphere_surface_area(radius):
    return 4 * math.pi * radius**2

def hemisphere_volume(radius):
    return (2/3) * math.pi * radius**3

#csa (curved surface area)
def hemisphere_csa(radius):
    return 2 * math.pi * radius**2

#tsa (total surface area)
def hemisphere_tsa(radius):
    return 3 * math.pi * radius**2

#R = radius of larger base
#r = radius of smaller base
#h = height of frustum
def frustum_slant_height(R, r, h):
    return math.sqrt((R - r)**2 + h**2)

def frustum_volume(R, r, h):
    return (1/3) * math.pi * h * (R**2 + r**2 + R*r)

#csa (curved surface area)
def frustum_csa(R, r, h):
    l = frustum_slant_height(R, r, h)
    return math.pi * (R + r) * l

#tsa (total surface area)
def frustum_tsa(R, r, h):
    l = frustum_slant_height(R, r, h)
    return math.pi * (R + r) * l + math.pi * R**2 + math.pi * r**2