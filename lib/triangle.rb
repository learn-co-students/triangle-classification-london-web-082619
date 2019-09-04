class Triangle

  attr_accessor :first, :second, :third
  
  def initialize(first, second, third)
    @first = first
    @second = second
    @third = third
  end

  def kind
      case
      when @first <= 0 || @second <= 0 || @third <= 0
        raise TriangleError
      when @first + @second <= @third || @first + @third <= @second || @second + @third <= @first
        raise TriangleError
      when @first == @second && @first == @third
        :equilateral
      when @first == @second || @first == @third || @second == @third
        :isosceles
      when @first != @second && @first != @third && @second != @third
        :scalene
      end
    end
      

  class TriangleError < StandardError

  end



end
