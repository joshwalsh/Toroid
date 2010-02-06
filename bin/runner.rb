$: << File.dirname(__FILE__) + "/../lib"

require 'game'
require 'planet'
require 'planet_renderer'

Session = Game.new 10,10
Render = PlanetRenderer.new Session.planet

puts Render.render