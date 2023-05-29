---@class vec
vec = {}
vec.__index = vec

function vec.__add( a, b)
    if type(a) == "number" then
        return vec(a + b.x, a + b.y)
    elseif type(b) == "number" then
        return vec(a.x + b, a.y + b)
    else
        return vec(a.x + b.x, a.y + b.y)
    end
end

function vec.__sub( a, b)
    if type(a) == "number" then
        return vec(a - b.x, a - b.y)
    elseif type(b) == "number" then
        return vec(a.x - b, a.y - b)
    else
        return vec(a.x - b.x, a.y - b.y)
    end
end

function vec.__mul( a, b)
    if type(a) == "number" then
        return vec(a * b.x, a * b.y)
    elseif type(b) == "number" then
        return vec(a.x * b, a.y * b)
    else
        return vec(a.x * b.x, a.y * b.y)
    end
end

function vec.__div( a, b)
    if type(a) == "number" then
        return vec(a / b.x, a / b.y)
    elseif type(b) == "number" then
        return vec(a.x / b, a.y / b)
    else
        return vec(a.x / b.x, a.y / b.y)
    end
end

function vec.__mod( a, b)
    if type(a) == "number" then
        return vec(a % b.x, a % b.y)
    elseif type(b) == "number" then
        return vec(a.x % b, a.y % b)
    else
        return vec(a.x % b.x, a.y % b.y)
    end
end

function vec.__eq( a, b)
    return a.x == b.x and a.y == b.y
end

function vec.__lt( a, b)
    return a.x < b.x or (a.x == b.x and a.y < b.y)
end

function vec.__le( a, b)
    return a.x <= b.x and a.y <= b.y
end

function vec.__unm( a)
    return vec(-a.x, -a.y)
end

function vec.__tostring( a)
    return "(x:" .. a.x .. ", y:" .. a.y .. ")"
end

---Returns a new vector
---@param x number
---@param y number
---@return vec
function vec.new( x, y)
    return setmetatable({x = x or 0, y = y or 0}, vec)
end

---Returns vector with all components set to 0
---@return vec
function vec.zero()
    return vec(0, 0)
end

---Returns vector with all components set to 1
---@return vec
function vec.one()
    return vec(1, 1)
end

---Returns vector with all components set a random value between 0 and 1
---If you want to specify the range, use vec.random(min, max)
---@param max number
---@param min number
---@return vec
function vec.random(max, min)
    if max == nil and min == nil then
        return vec(math.random(), math.random())
    else
        return vec(math.random(max,min), math.random(max,min))
    end
end

---Returns the maximum value of the components of the vector
---@param a vec
---@param b vec
---@return vec
function vec.max( a, b)
    return vec(math.max(a.x, b.x), math.max(a.y, b.y))
end

---Returns the minimum value of the components of the vector
---@param a vec
---@param b vec
---@return vec
function vec.min( a ,b)
    return vec(math.min(a.x, b.x), math.min(a.y, b.y))
end

---Returns a vector with the vector components clamped between the max and min vectors
---@param a vec
---@param max vec
---@param max vec
---@return vec
function vec.clamp( a, max, min)
    return vec.max(vec.min(a, max), min)
end

---Returns a vector with a clamped lenght between the min and max numbers
---@param a vec
---@param min number
---@param max number
---@return vec
function vec.clampLenght( a, min, max)
    local len = math.clamp(a:len(), min, max)
    return a:normalize() * len
end

---Lerps between two vectors and return the result
---@param a vec
---@param b vec
---@param delta number
---@return vec
function vec.lerp( a, b, delta)
    return a + (b - a) * delta
end

---Returns the floor of the components of the vector
---@param a vec
---@return vec
function vec.floor( a)
    return vec(math.floor(a.x), math.floor(a.y))
end

---Returns the ceil of the components of the vector
---@param a vec
---@return vec
function vec.ceil( a)
    return vec(math.ceil(a.x), math.ceil(a.y))
end

---Returns the distance between two vectors
---@param a vec
---@param b vec
---@return number
function vec.distanceTo( a, b)
    return (b - a):len()
end

---Returns the angle between two vectors
---@param a vec
---@param b vec
---@return number
function vec.angleTo( a, b)
    return math.atan2(b.y - a.y, b.x - a.x)
end

---Returns a clone of the vector
function vec:clone()
    return vec(self.x, self.y)
end

---Return two values representing the vector components
function vec:unpack()
    return self.x, self.y
end

---Returns the length of the vector
function vec:len()
    return math.sqrt(self.x * self.x + self.y * self.y)
end

---Returns the length of the vector squared
function vec:lenSq()
    return self.x * self.x + self.y * self.y
end

---Normilizes the vector
function vec:normalize()
    local len = self:len()
    self.x = self.x / len
    self.y = self.y / len
    return self
end

---Returns a normilized copy of the vector
function vec:normalized()
    return self / self:len()
end

---Rotates the vector by the given angle in radians
---@param phi number
function vec:rotate(phi)
    local c = math.cos(phi)
    local s = math.sin(phi)
    self.x = c * self.x - s * self.y
    self.y = s * self.x + c * self.y
    return self
end

---Rotate the vector around a pivot by the given angle in radians
---@param phi number
---@param pivot vec
function vec:rotateAround(phi, pivot)
    self.x = self.x - pivot.x
    self.y = self.y - pivot.y
    local c = math.cos(phi)
    local s = math.sin(phi)
    self.x = c * self.x - s * self.y
    self.y = s * self.x + c * self.y
    self.x = self.x + pivot.x
    self.y = self.y + pivot.y
    return self
end

---Returns the vector rotated by the given angle in radians
---@param phi number
function vec:rotated(phi)
    return self:clone():rotate(phi)
end

---Returns the vector rotated around a pivot by the given angle in radians
---@param phi number
---@param pivot vec
function vec:rotatedAround(phi, pivot)
    return self:clone():rotateAround(phi, pivot)
end

---Returns the angle of the vector in radians 
function vec:angle()
    return math.atan2(self.y, self.x)
end

---Returns a perpendicular vector
function vec:perpendicular()
    return vec.new(-self.y, self.x)
end

---Returns the projection of the vector on the given vector
---@param other vec
function vec:projectOn(other)
    return (self * other) * other / other:lenSq()
end

---Returns the dot product of the vector and the other vector
---@param other vec
function vec:dot(other)
    return self.x * other.x + self.y * other.y
end

---Returns the cross product of the vector and the other vector
---@param other vec
function vec:cross(other)
    return self.x * other.y - self.y * other.x
end

return setmetatable(vec, { __call = function(_, ...) return vec.new(...) end })
