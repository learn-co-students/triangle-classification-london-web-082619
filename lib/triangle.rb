require 'pry'

class Triangle
  
  attr_accessor :side1, :side2, :side3
  @@all = []

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @@all << self
  end

  def self.all
    @@all
  end

  def kind
    if side1 == 0 && side2 == 0 && side3 == 0 || side1 < 0 || side2 < 0 || side3 < 0 || side1 + side2 <= side3 || side2 + side3 <= side1 || side3 + side1 <= side2
      raise TriangleError
    else
      if side1 == side2 && side2 == side3 #(10, 10, 10)
        return :equilateral
      elsif side1 != side2 && side2 != side3 && side3 != side1 #(3, 4, 5)
        return :scalene
      elsif side1 == side2 || side2 == side3 || side3 == side1
        return :isosceles
      else 
        #do nothing
      end
    end
    
  end

  class TriangleError < StandardError
  end

end

# t = Triangle.new(0, 0, 0)

# binding.pry
# 'save'