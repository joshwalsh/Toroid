class Organism < ActiveRecord::Base
  belongs_to :planet

  validates :name, presence: true
end
