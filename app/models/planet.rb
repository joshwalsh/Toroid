class Planet < ActiveRecord::Base
  has_many :organisms

  validates :name, presence: true
end
