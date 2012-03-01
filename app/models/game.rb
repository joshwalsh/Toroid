class Game < ActiveRecord::Base
  def self.current
    @game = last
    @game ||= Game.create(year: 1)

    @game
  end

  private

end