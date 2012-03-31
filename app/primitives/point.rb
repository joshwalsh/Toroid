class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(comparison) 
    (@x == comparison.x) && (@y == comparison.y)
  end
end