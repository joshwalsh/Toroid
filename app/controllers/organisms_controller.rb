class OrganismsController < ApplicationController
  respond_to :html, :json

  def index
    game = Game.current
    @planet = game.planets[params[:planet_id].to_i]
    @organisms = @planet.organisms

    respond_with @organisms
  end
end