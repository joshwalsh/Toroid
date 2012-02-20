class Planet < ActiveRecord::Base
  has_many :organisms
  validates :name, :width, :height, presence: true
  before_create :setup_creation_attributes

  def size
    width * height
  end

  def place_organism(x,y,organism)
    organism.x = x
    organism.y = y
    organism.save

    organisms << organism
  end

  private

  def setup_creation_attributes
    game = Game.current
    self.birth_year = game.year
  end
end
