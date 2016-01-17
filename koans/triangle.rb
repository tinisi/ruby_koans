# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)

  # throw for invalids

  if a == 0 && b == 0 && c == 0
    raise TriangleError, "all goose eggs"
  end
  if a < 0 || b < 0 || c < 0
    raise TriangleError, "don't be negative"
  end

  if a == b && b == c
    :equilateral
  elsif a == b || a == c || b == c

    # check for some special invalid states that only apply to isosceles
    sides = [a,b,c].sort

    # TODO: this isn't quite right, too brute force
    # It is possible that the side that isn't a pair could be the long one.
    long_side = sides.max
    short_side = sides.min

    # comparing to the middle tells me what I want to know
    # I don't think this equates to obtuse and acute
    # but I think I need to know
    if short_side == sides[1]
      unique_side = :long_side
    elsif long_side == sides[1]
      unique_side = :short_side
    end

    # debugging!
    # puts a
    # puts b
    # puts c
    # puts sides
    # puts sides[0] + sides[1]
    # puts sides.to_s
    # puts unique_side
    # puts "_____________"

    # Pretty sure this error can't happen
    if unique_side == :long_side
      if sides[2] > (sides[0] + sides[1])
        raise TriangleError, "no reaching"
      end
      if sides[2] == (sides[0] + sides[1])
        raise TriangleError, "i'm a line"
      end
    end

    :isosceles
  else
    # anything else can fall through to the default
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
