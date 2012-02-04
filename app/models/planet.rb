class Planet < ActiveRecord::Base
  validates :name, presence: true
end
