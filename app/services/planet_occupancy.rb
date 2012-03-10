class PlanetOccupancy
  def initialize(planet)
    @planet = planet
  end

  def place_organism(x, y, organism)
    organism.x = x
    organism.y = y

    @planet.organisms << organism
  end

  def find_by_coordinate(x, y)
    @planet.organisms.each do |organism|
      return organism if organism.x == x && organism.y == y
    end

    return nil
  end

  def select_random_adjacent_coordinate(x, y)
    directions = [:left, :right, :up, :down]
    random_direction = directions.shuffle.first

    cell_in_direction = CellInDirection.new @planet
    cell_in_direction.send(random_direction, x, y)
  end

  def move_organism(organism, x, y)
    organism.x = x
    organism.y = y
  end
end