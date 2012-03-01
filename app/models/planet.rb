class Planet < ActiveRecord::Base
  has_many :organisms
  validates :name, :width, :height, presence: true
  before_create :setup_creation_attributes

  def size
    width * height
  end

  def age
    game = Game.current
    game.year - birth_year
  end

  def run
    occupancy = PlanetOccupancy.new self

    organisms.each do |organism|
      x = organism.x
      y = organism.y
      new_coordinate = occupancy.select_random_adjacent_coordinate(x, y)

      occupancy.move_organism(organism, new_coordinate[0], new_coordinate[1])

      Log.record "PLANET: #{name}, ORGANISM: #{organism.name}, moved from #{x}, #{y} to #{organism.x}, #{organism.y}"
    end

    Log.record "PLANET: #{name}: Age #{age}"
  end

  private

  def setup_creation_attributes
    game = Game.current
    self.birth_year = game.year
  end
end
