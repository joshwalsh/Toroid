module Tordoid
  class CellNavigator
    class CurrentlyOccupiedError < StandardError; end

  def initialize(planet)
    @planet = planet
  end

  def cell_in_direction(x, y, direction)
    send(direction, x, y)
  end

  def transport(x, y, new_x, new_y)
    @planet[new_x, new_y] = @planet[x, y]
    @planet[x,y] = nil
  end

  def move(x, y, direction)
    new_x, new_y = cell_in_direction(x, y, direction)

    if @planet.occupied? new_x, new_y
      raise CurrentlyOccupiedError
    end

    transport(x, y, new_x, new_y)
  end

  def move_at_random(x, y)
    return false if empty_neighbor_cells(x, y) == []

    new_cell = empty_neighbor_cells(x,y).first

    transport(3, 3, new_cell[0], new_cell[1])
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
