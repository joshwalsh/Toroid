class PlanetsController < ApplicationController
  def show
    @planet = Planet.find(params[:id])
  end

  def index
    @planets = Planet.all
  end
end