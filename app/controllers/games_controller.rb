class GamesController < ApplicationController
  def show
    @game = Game.current 
  end

  def advance
    @game = Game.current
    @game.run_for_years
    @game.save

    render :show
  end
end