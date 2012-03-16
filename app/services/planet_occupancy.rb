class PlanetOccupancy
  def initialize(planet)
    @planet = planet
  end

  def place_organism(point, organism)
    organism.x = point.x
    organism.y = point.y

    @planet.organisms << organism
  end

  def find_by_coordinate(point)
    @planet.organisms.each do |organism|
      return organism if organism.x == point.x && organism.y == point.y
    end

    return nil
  end

  def select_random_adjacent_coordinate(x, y)
    directions = [:left, :right, :up, :down]
    random_direction = directions.shuffle.first

    cell_in_direction = CellInDirection.new @planet
    cell_in_direction.send(random_direction, x, y)
  end

  def move_organism(organism, point)
    organism.x = point.x
    organism.y = point.y
  end
end