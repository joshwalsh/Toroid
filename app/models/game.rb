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
      Log.record "TIME: Year #{self.year}"
      self.save

      run_planets
    end
  end

  private

  def run_planets(planets = nil)
      planets ||= Planet.all

      planets.each do |planet|
        planet.run
      end
  end
end