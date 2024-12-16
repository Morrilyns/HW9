module Geometry

export Point2D, Point3D, Polygon, distance, perimeter, isRectangular

# Define Point2D
struct Point2D{T<:Real}
    x::T
    y::T

    # Default constructor for x and y as separate arguments
    function Point2D(x::T, y::T) where T<:Real
        new{T}(x, y)
    end

    # Constructor for parsing a string like "(x,y)"
    function Point2D(str::String)
        coords = split(replace(str, "(" => "", ")" => ""), ",")
        x = parse(Float64, coords[1])
        y = parse(Float64, coords[2])
        new{Float64}(x, y)
    end
end

# Define Point3D
struct Point3D{T<:Real}
    x::T
    y::T
    z::T
end

# Define Polygon
struct Polygon{T}
    points::Vector{Point2D{T}}

    # Constructor 1: Vector of Point2D (default)
    function Polygon(points::Vector{Point2D{T}}) where T<:Real
        length(points) ≥ 3 || error("Polygon requires at least 3 points")
        new{T}(points)
    end

    # Constructor 2: Vector of Real numbers
    function Polygon(coordinates::Vector{T}) where T<:Real
        length(coordinates) % 2 == 0 || error("Coordinates array must have an even number of elements")
        points = [Point2D(coordinates[i], coordinates[i+1]) for i in 1:2:length(coordinates)]
        length(points) ≥ 3 || error("Polygon requires at least 3 points")
        new{T}(points)
    end

    # Constructor 3: Vararg for any number of real numbers
    function Polygon(coordinates::Vararg{T}) where T<:Real
        Polygon(collect(coordinates))
    end
end

# Function to calculate the Euclidean distance between two Point2D objects
function distance(p1::Point2D, p2::Point2D)
    sqrt((p2.x - p1.x)^2 + (p2.y - p1.y)^2)
end

# Function to calculate the Euclidean distance between two Point3D objects
function distance(p1::Point3D, p2::Point3D)
    sqrt((p2.x - p1.x)^2 + (p2.y - p1.y)^2 + (p2.z - p1.z)^2)
end

# Function to calculate the perimeter of a Polygon
function perimeter(polygon::Polygon)
    sum(distance(polygon.points[i], polygon.points[i % length(polygon.points) + 1]) for i in 1:length(polygon.points))
end

# Placeholder function for checking if a Polygon is rectangular
function isRectangular(polygon::Polygon)
    false
end

"""
midpoint(p::Polyon)
calculates the midpoint of the polygon.
"""
midpoint(p::Polygon) = Point2D(mean(map(pt -> pt.x, p.pts)), mean(map(pt -> pt.y, p.pts)))


end # End of module Geometry
