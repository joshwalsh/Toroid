class Organism < ActiveRecord::Base
  belongs_to :planet

  validates :name, presence: true

  def self.find_by_coordinate(x,y)
    find(:first, conditions: ["x = ? and y = ?", x, y])
  end
end
