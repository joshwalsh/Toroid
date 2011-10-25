module Tordoid
  class CellNavigator
    class CurrentlyOccupiedError < StandardError; end

  def initialize(planet)
    @planet = planet
  end

  def cell_in_direction(x, y, direction)
    send(direction, x, y)
  end

  def move(x, y, direction)
    x2, y2 = cell_in_direction(x, y, direction)

    if @planet.occupied? x2, y2
      raise CurrentlyOccupiedError
    end

    @planet[x2, y2] = @planet[x, y]
    @planet[x,y] = nil
  end

  def neighbors(x, y)
    [:up, :right, :down, :left].map do |direction|
      cell_in_direction x, y, direction
    end
  end

  def empty_neighbor_cells(x,y)
    neighbors(x, y).select do |neighbor_x, neighbor_y|
      !@planet.occupied? neighbor_x, neighbor_y 
    end
  end

  def left(x,y)
    if x == 0
      new_x = @planet.width - 1
    else
      new_x = x - 1
    end

    [new_x, y]
  end

  def right(x,y)
    if x == (@planet.width - 1)
      new_x = 0
    else
      new_x = x + 1
    end

    [new_x, y]
  end

  def down(x,y)
    if y == (@planet.height - 1)
      new_y = 0
    else
      new_y = y + 1
    end

    [x, new_y]
  end

  def up(x,y)
    if y == 0
      new_y = @planet.height - 1
    else
      new_y = y - 1
    end

    [x, new_y]
  end
  end
end
