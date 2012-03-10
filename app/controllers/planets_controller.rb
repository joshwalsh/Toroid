class PlanetsController < ApplicationController
  def show
    game = Game.current
    @planet = game.planets[params[:id].to_i]
    @age = CalculateAge.for_year(game.year, @planet)
  end

  def index
    game = Game.current
    @planets = game.planets
  end
end