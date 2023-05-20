class Triangle
  # write code here
   attr_reader :side1, :side2, :side3
  
    def initialize(side1, side2, side3)
      @side1 = side1
      @side2 = side2
      @side3 = side3
      validate_triangle
    end
  
    def kind
      if side1 == side2 && side2 == side3
        :equilateral
      elsif side1 == side2 || side2 == side3 || side1 == side3
        :isosceles
      else
        :scalene
      end
    end
  
    private
  
    def validate_triangle
      unless valid_sides?
         raise TriangleError, "Invalid triangle: All sides must have a length greater than 0."
      end
  
      unless satisfies_triangle_inequality?
        raise TriangleError, "Invalid triangle: The sum of the lengths of any two sides must be greater than the length of the third side."
      end
    end
  
    def valid_sides?
      side1 > 0 && side2 > 0 && side3 > 0
    end
  
    def satisfies_triangle_inequality?
      side1 + side2 > side3 && side2 + side3 > side1 && side1 + side3 > side2
    end
  
    class TriangleError < StandardError
    end
  end

