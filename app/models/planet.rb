class Planet < ActiveRecord::Base
  has_many :organisms
  validates :name, presence: true

  def size
    width * height
  end

  def place_organism(x,y,organism)
    organism.x = x
    organism.y = y
    organism.save

    organisms << organism
  end
end
