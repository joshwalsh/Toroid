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
    x2, y2 = cell_in_direction(x, y, direction)

    return false if occupied? x2, y2

    self[x2, y2] = self[x, y]
    self[x, y] = nil
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
    [:up, :right, :down, :left].map do |direction|
      cell_in_direction x, y, direction
    end
  end

  def empty_neighbor_cells(x,y)
    neighbors(x, y).select do |neighbor_x, neighbor_y|
      !occupied? neighbor_x, neighbor_y 
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

  def occupied?(x, y)
    self[x,y] != nil
  end

  def size
    @width * @height
  end
end
