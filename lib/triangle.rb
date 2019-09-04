class Triangle

  @@all=[]

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @@all << self
  end

  def kind
    if triangle_valid?
      if @a == @b && @b == @c && @c == @a
        return :equilateral
      elsif @a == @b || @b == @c || @c == @a
        return :isosceles
      else
        return :scalene
      end
    end
  end

  def triangle_valid?
    if self.no_sides
      raise TriangleError
    elsif self.negative_sides
      raise TriangleError
    elsif self.triangle_identity
      raise TriangleError
    end
    true
  end

  def no_sides
    [@a, @b, @c].include?(0)
  end

  def negative_sides
    [@a, @b, @c].any?{|side| side < 0}
  end

  def triangle_identity
    if (@a + @b) < @c || (@b + @c) < @a || (@c + @a) < @b
      return false
    end
    true
  end

  class TriangleError < StandardError

    def no_sides
      "There are no sides."
    end
  
    def negative_sides
      "One of the sides is negative."
    end
  
    def triangle_identity
      "This triangle does not satisfy the triangle identity."
    end
  
  end

end

