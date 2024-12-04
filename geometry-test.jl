using Geometry

# Test structures and constructors
p1 = Point2D{Float64}(1.0, 2.0)
p2 = Point2D{Float64}(3.0, 4.0)
triangle = Polygon{Float64}([Point2D{Float64}(0.0, 0.0), Point2D{Float64}(1.0, 0.0), Point2D{Float64}(1.0, 1.0)])
rectangle = Polygon{Float64}([Point2D{Float64}(0.0, 0.0), Point2D{Float64}(2.0, 0.0), Point2D{Float64}(2.0, 1.0), Point2D{Float64}(0.0, 1.0)])

# Test the constructors
p1, p2, triangle, rectangle

# Test the perimeter function
perimeter(triangle), perimeter(rectangle)

# Test the distance function
distance(p1, p2), distance(Point3D{Float64}(1.0, 2.0, 3.0), Point3D{Float64}(4.0, 5.0, 6.0))
 