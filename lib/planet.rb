class Planet
  attr_reader :grid

  def initialize(x, y)
    @width = x
    @height = y
    @grid = []
  end

  def [](x,y)
    return false if x > (@width - 1)
    return false if y > (@height - 1)

    key = key_for_coordinate x,y
    @grid[key]
  end

  def []=(x,y,organism)
    return false if x > @width
    return false if y > @height

    key = key_for_coordinate x,y
    @grid[key] = organism
  end

  def move(x,y,direction)
    origin = key_for_coordinate x,y
    organism = @grid[origin]
    
    destination = move_organism(origin, direction)

    @grid[destination] = organism
    @grid[origin] = nil
  end
     
  def move_organism(key, direction)
    send(direction, key)
  end
  
  def left(key)
    if key % @width == 0
      key + @width - 1
    else
      key - 1
    end
  end

  def right(key)
    if (key + 1) % @width == 0
      key - @width + 1
    else
      key + 1
    end
  end

  def down(key)
    if key >= (size - @width)
      key % @width
    else
      key + @width 
    end
  end

  def up(key)
    if key < @height
      size - (@width - key)
    else
      key - @width 
    end
  end

  def size
    @width * @height
  end

  def key_for_coordinate(x,y)
    (@width * y) + x
  end
end
