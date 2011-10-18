$: << File.dirname(__FILE__) + "/../lib"

require 'game'
require 'planet'
require 'planet_populator'
require 'planet_renderer'

NewLine = "\n"

def reset_cursor(num_lines) 
  "\033[#{num_lines}A\r"
end

def position_post_cursor(num_lines)
  "\033[#{num_lines}B\r"
end

10.times do |i|
  session = Game.new 10,10
  session.populate 15

  render = PlanetRenderer.new session.planet

  print render.render
  print NewLine
  print "ITERATION #{i}"

  STDOUT.flush
  print reset_cursor(10)
  sleep 1
end

print position_post_cursor(10)

