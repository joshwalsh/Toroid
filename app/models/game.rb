class Game < ActiveRecord::Base
  def self.current
   @game = find(1) 
  end
end