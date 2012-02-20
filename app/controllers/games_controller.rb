class GamesController < ApplicationController
  def show
    @game = Game.current 
  end

  def advance
    @game = Game.current
    @game.year += 1
    @game.save

    render :show
  end
end