class CellInDirection
  def initialize(planet)
    @planet = planet
  end

  def left(point)
    if point.x == 0
      new_x = @planet.width - 1
    else
      new_x = point.x - 1
    end

    Point.new(new_x, point.y)
  end

  def right(point)
    if point.x == (@planet.width - 1)
      new_x = 0
    else
      new_x = point.x + 1
    end

    Point.new(new_x, point.y)
  end

  def down(point)
    if point.y == (@planet.height - 1)
      new_y = 0
    else
      new_y = point.y + 1
    end

    Point.new(point.x, new_y)
  end

  def up(point)
    if point.y == 0
      new_y = @planet.height - 1
    else
      new_y = point.y - 1
    end

    Point.new(point.x, new_y)
  end
end