require 'pry'

class Triangle
  attr_reader :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end

  def ordered_lengths #order lengths by size
    a = [@length1, @length2, @length3]
    a.sort  
  end
 
  def invalid_triangle? #via the triangle inequality x+y >= z (z is largest side)
    ordered_lengths[0] + ordered_lengths[1] <= ordered_lengths[2]
  end

  def negative_vals? #checks if any vals are negative or zero
    @length1 <= 0 || @length2 <= 0 || @length3 <= 0
  end

  def equilateral?
    ordered_lengths.uniq.length == 1
  end

  def isosceles?
    ordered_lengths.uniq.length == 2
  end


  def kind
    if invalid_triangle?
      raise TriangleError
    elsif negative_vals?
      raise TriangleError  
    elsif equilateral?
        :equilateral
    elsif isosceles?
        :isosceles
    else
        :scalene
    end
  
  end

  class TriangleError < StandardError
  end

end

