class GamesController < ApplicationController
  def show
    @game = Game.current 
  end

  def advance
    @game = Game.current

    Rails.logger.info @game.inspect
    runner = RunGame.new @game
    runner.for_year

    PersistState.save(@game)

    respond_to do |format|
      format.json { render json: @game }
    end
  end
end