class Planet < ActiveRecord::Base
  has_many :organisms

  validates :name, presence: true

  def size
    width * height
  end
end
