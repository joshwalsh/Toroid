class Planet
  attr_reader :grid

  def initialize(x, y)
    @width = x
    @height = y
    @grid = Hash.new
  end

  def [](x,y)
    return false if x > (@width - 1)
    return false if y > (@height - 1)

    @grid[[x,y]]
  end

  def []=(x,y,organism)
    return false if x > (@width - 1)
    return false if y > (@height - 1)

    @grid[[x,y]] = organism
  end

  def move(x,y,direction)
    organism = @grid[[x,y]]
    destination = key_by_direction(x, y, direction)

    return false if occupied? destination

    @grid[destination] = organism
    @grid[[x,y]] = nil
  end
     
  def key_by_direction(x, y, direction)
    send(direction, x, y)
  end
  
  def occupied?(location)
    @grid[location] != nil
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

  def size
    @width * @height
  end
end
