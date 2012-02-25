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

  def place_organism(x,y,organism)
    organism.x = x
    organism.y = y
    organism.save

    organisms << organism
  end

  def run
    Log.record "PLANET: #{name}: Age #{age}"
  end

  private

  def setup_creation_attributes
    game = Game.current
    self.birth_year = game.year
  end
end
