class Planet
  attr_reader :grid

  def initialize(x, y)
    @width, @height = x, y
    @grid = Hash.new
  end

  def [](x,y)
    return false if outside_grid? x, y

    @grid[[x,y]]
  end

  def []=(x,y,organism)
    return false if outside_grid? x, y

    @grid[[x,y]] = organism
  end

  def move(x,y,direction)
    origin = [x,y]
    destination = cell_in_direction(x, y, direction)

    return false if occupied? destination

    @grid[destination] = @grid[origin]
    @grid[origin] = nil
  end
     
  def left(x,y)
    if x == 0
      [@width - 1, y]
    else
      [x - 1, y] 
    end
  end

  def right(x,y)
    if x == (@width - 1)
      [0, y]
    else
      [x + 1, y] 
    end
  end

  def down(x,y)
    if y == (@height - 1)
      [x, 0]
    else
      [x, y + 1] 
    end
  end

  def up(x,y)
    if y == 0
      [x, @height - 1]
    else
      [x, y - 1] 
    end
  end

  def neighbors(x, y)
    [:up, :right, :down, :left].collect do |direction|
      cell_in_direction x, y, direction
    end
  end

  def cell_in_direction(x, y, direction)
    send(direction, x, y)
  end
  
  def outside_grid?(x,y)
    return true if x > (@width - 1)
    return true if y > (@height - 1)
    false
  end

  def occupied?(location)
    @grid[location] != nil
  end

  def size
    @width * @height
  end
end
