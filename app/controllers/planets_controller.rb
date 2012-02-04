class PlanetsController < ApplicationController
  def show
    @planet = Planet.find(params[:id])
  end
end
