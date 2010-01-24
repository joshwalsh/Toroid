class Planet
  def initialize(x, y)
    @width = x
    @height = y
    @grid = []
  end

  def [](x,y)
    key = determine_key_for_coordinate x,y
    @grid[key]
  end

  def []=(x,y,value)
    key = determine_key_for_coordinate x,y
    @grid[key] = value
  end
     
  def empty?
    true
  end

  def size
    @width * @height
  end

  def determine_key_for_coordinate(x,y)
    (@width * y) + x
  end
end
