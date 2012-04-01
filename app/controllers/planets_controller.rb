class PlanetsController < ApplicationController
  def show
    game = Game.current
    @planet = game.find_planet(params[:id])
    @age = CalculateAge.for_year(game.year, @planet)
  end

  def index
    game = Game.current
    @planets = game.planets
  end

  def new
    game = Game.current
    @planet = Planet.new game
  end

  def create
    game = Game.current

    planet = Planet.new game
    planet.name = params[:planet][:name]
    planet.width = params[:planet][:width]
    planet.height = params[:planet][:height]

    game.planets << planet
    PersistState.save game

    flash[:notice] = "The planet #{planet.name} was created"
    redirect_to planet
  end
end