The given code defines a Lua module that implements a 2D vector class called `vec`. This class provides various methods and operators for performing vector operations.

The `vec` class has the following methods:

-   `vec.new(x, y)`: Creates a new vector object with the specified `x` and `y` components.
-   `vec.zero()`: Returns a vector with all components set to 0.
-   `vec.one()`: Returns a vector with all components set to 1.
-   `vec.random(max, min)`: Returns a vector with all components set to random values between 0 and 1. If `max` and `min` are specified, the random values will be within that range.
-   `vec.max(a, b)`: Returns a vector with each component being the maximum value between the corresponding components of vectors `a` and `b`.
-   `vec.min(a, b)`: Returns a vector with each component being the minimum value between the corresponding components of vectors `a` and `b`.
-   `vec.clamp(a, max, min)`: Returns a vector with each component clamped between the corresponding components of vectors `max` and `min`.
-   `vec.clampLength(a, min, max)`: Returns a vector with a clamped length between the specified `min` and `max` values.
-   `vec.lerp(a, b, delta)`: Performs linear interpolation between vectors `a` and `b` based on the `delta` value and returns the resulting vector.
-   `vec.floor(a)`: Returns a new vector with the components rounded down to the nearest integer.
-   `vec.ceil(a)`: Returns a new vector with the components rounded up to the nearest integer.
-   `vec.distanceTo(a, b)`: Returns the distance between vectors `a` and `b`.
-   `vec.angleTo(a, b)`: Returns the angle (in radians) between vectors `a` and `b`.
-   `vec:clone()`: Creates a new vector object with the same `x` and `y` components as the original vector.
-   `vec:unpack()`: Returns the `x` and `y` components of the vector as separate values.
-   `vec:len()`: Returns the length of the vector.
-   `vec:lenSq()`: Returns the squared length of the vector.
-   `vec:normalize()`: Normalizes the vector, making its length equal to 1.
-   `vec:normalized()`: Returns a normalized copy of the vector without modifying the original vector.
-   `vec:rotate(phi)`: Rotates the vector by the specified angle (in radians).
-   `vec:rotateAround(phi, pivot)`: Rotates the vector around a pivot point by the specified angle (in radians).
-   `vec:rotated(phi)`: Returns a new vector that is rotated by the specified angle (in radians) relative to the original vector.
-   `vec:rotatedAround(phi, pivot)`: Returns a new vector that is rotated around a pivot point by the specified angle (in radians) relative to the original vector.
-   `vec:angle()`: Returns the angle (in radians) of the vector.
-   `vec:perpendicular()`: Returns a new vector that is perpendicular to the original vector.
-   `vec:projectOn(other)`: Returns the projection of the vector onto the specified `other` vector.
-   `vec:dot(other)`: Returns the dot product of the vector and the specified `other` vector.
-   `vec:cross(other)`: Returns the cross product of the vector and the specified `other` vector.

In addition to the methods, the `vec` class overloads various operators (`+`, `-`, `*`, `/`, `%`, `==`, `<`, `<=`, `unary -`, and `tostring`) to perform vector arithmetic and comparison operations.

To use this `vec` module in your Lua code, you can do the following:

    local vec = require("vec")
    
    -- Create vectors
    local v1 = vec(2, 3)
    local v2 = vec(4, 5)
    
    -- Perform vector operations
    local v3 = v1 + v2
    local v4 = v1 * 2
    local distance = vec.distanceTo(v1, v2)
    -- ...and so on
    
    -- Print vectors
    print(v1) -- Output: (x:2, y:3)
    print(v2) -- Output: (x:4, y:5)

