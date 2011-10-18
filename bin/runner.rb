$: << File.dirname(__FILE__) + "/../lib"

require 'game'
require 'planet'
require 'planet_populator'
require 'planet_renderer'
require 'console_outputter'

10.times do |i|
  session = Game.new 10,10
  session.populate 15

  render = PlanetRenderer.new session.planet

  ConsoleOutputter.output render.render
  ConsoleOutputter.new_line
  ConsoleOutputter.output "ITERATION #{i}"

  ConsoleOutputter.flush

  ConsoleOutputter.move_cursor_up(10)
  sleep 1
end

ConsoleOutputter.move_cursor_down(10)
