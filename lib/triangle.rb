class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

  end

  def kind()
    if sides.any? { | side | side <= 0 } ||
    self.sides.min(2).sum <= self.sides.max
      raise TriangleError
    end

    if self.sides == self.sides.uniq
      return :scalene
    elsif self.sides.uniq.length() == 1
      return :equilateral
    else
      return :isosceles
    end

  end

    class TriangleError < StandardError
    end


end
