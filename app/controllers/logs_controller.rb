class LogsController < ApplicationController
  def game
    @logs = Log.all
  end
end