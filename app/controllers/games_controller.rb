class GamesController < ApplicationController
  def show
    @game = Game.current 
  end

  def advance
    @game = Game.current

    runner = RunGame.new @game
    runner.for_year

    render :show
  end
end