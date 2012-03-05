require 'app/services/persist_state'

class Game
  attr_accessor :year
  attr_accessor :planets

  def initialize
    @planets = []
  end

  def self.current
    PersistState.load || new
  end
end