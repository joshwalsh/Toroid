class Game < ActiveRecord::Base
  def self.current
    @game = last

    if @game.nil?
      @game = Game.create(year: 1)
    end

    @game
  end

  def run_for_years(years = 1)
    years.times do 
      self.year += 1
    end
  end
end