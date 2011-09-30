$: << File.dirname(__FILE__) + "/../lib"

require 'game'
require 'planet'
require 'planet_populator'
require 'planet_renderer'

Session = Game.new 10,10
Session.populate 15

Render = PlanetRenderer.new Session.planet

system("clear")
puts Render.render
