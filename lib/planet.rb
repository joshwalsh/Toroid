class Planet
  def initialize(x, y)
    @width = x
    @height = y
    @grid = []
  end

  def [](x,y)
    key = key_for_coordinate x,y
    @grid[key]
  end

  def []=(x,y,value)
    key = key_for_coordinate x,y
    @grid[key] = value
  end
     
  def grid
    @grid
  end

  def size
    @width * @height
  end

  def key_for_coordinate(x,y)
    (@width * y) + x
  end
end
