class LogsController < ApplicationController
  def game
    game = Game.current
    @logs = game.logs
  end
end