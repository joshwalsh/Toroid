class Game < ActiveRecord::Base
  def self.current
    @game = last

    if @game.nil?
      @game = Game.create(year: 1)
    end

    @game
  end
end