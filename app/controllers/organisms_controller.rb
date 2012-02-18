class OrganismsController < ApplicationController
  respond_to :html, :json

  def index
    @planet = Planet.find(params[:planet_id])
    @organisms = @planet.organisms

    respond_with @organisms
  end
end