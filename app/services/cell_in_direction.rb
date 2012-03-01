class CellInDirection
  def initialize(planet)
    @planet = planet
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