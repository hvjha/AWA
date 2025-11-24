Geometry Toolkit

geometry_toolkit is a lightweight and comprehensive Python package designed to perform geometric calculations for both 2D shapes and 3D solid figures.
It is ideal for students, developers, and professionals who work with geometry-related computations.

Features

Supports 49+ geometric formulas

Covers 2D shapes (triangle, square, circle, rhombus, trapezium, etc.)

Covers 3D solids (cube, cuboid, cylinder, cone, sphere, hemisphere, frustum)

Clean and simple function-based API

Beginner-friendly and easy to integrate in any project

Installation

Install the package using pip:

pip install geometry_toolkit

Usage Example

for single import
from geometry_toolkit import rectangle_area
print(rectangle_area(4,5))   #20

for multiple import

from geometry_toolkit import (
    rectangle_area, rectangle_perimeter, rectangle_diagonal,
    square_area, square_perimeter, square_diagonal,
    circle_area, circle_circumference
)

when we want to import all
from geometry_toolkit import *

print(rectangle_area(5, 3))          # 15
print(square_perimeter(4))           # 16
print(circle_area(3))                # 28.27
print(circle_circumference(3))       # 18.85

Supported Functions
1. Rectangle
    rectangle_area
    rectangle_perimeter
    rectangle_diagonal

2. Square
    square_area
    square_perimeter
    square_diagonal

3. Triangle
    triangle_area_simple
    triangle_area_herons
    triangle_perimeter

4. Equilateral Triangle
    equiletral_triangle_area
    equiletral_triangle_perimeter
    equiletral_triangle_height

5. Parallelogram
    parellelogram_area
    parellelogram_perimeter

6. Rhombus
    rhombus_area_diagonal
    rhombus_area_height
    rhombus_perimeter

7. Trapezium
    trapezium_area

8. Circle
    circle_area
    circle_circumference
    arc_length
    sector_area

9. Semicircle
    semicircle_area
    semicircle_perimeter

3D Shapes

10. Cube
    cube_volume
    cube_tsa
    cube_lsa
    cube_diagonal

11. Cuboid
    cuboid_volume
    cuboid_tsa
    cuboid_lsa
    cuboid_diagonal

12. Cylinder
    cylinder_volume
    cylinder_csa
    cylinder_tsa

13. Cone
    cone_slant_height
    cone_volume
    cone_csa
    cone_tsa

14. Sphere
    sphere_volume
    sphere_surface_area

15. Hemisphere
    hemisphere_volume
    hemisphere_csa
    hemisphere_tsa

16. Frustum of a Cone
    frustum_slant_height
    frustum_volume
    frustum_csa
    frustum_tsa

Cotributing

Contributions, issues, and feature requests are welcome.
Feel free to submit a pull request or open an issue on the repository.

License

This project is released under the MIT License.