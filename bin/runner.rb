#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"

require 'game'
require 'planet'
require 'planet_populator'
require 'planet_renderer'
require 'console_outputter'

width = ConsoleOutputter.request_value("Board width: ").to_i
height = ConsoleOutputter.request_value("Board height: ").to_i
population = ConsoleOutputter.request_value("Population: ").to_i
years = ConsoleOutputter.request_value("Years: ").to_i

ConsoleOutputter.new_line

years.times do |i|
  session = Game.new width,height
  session.populate population

  render = PlanetRenderer.new session.planet

  ConsoleOutputter.output render.render
  ConsoleOutputter.new_line
  ConsoleOutputter.output "#{i + 1} YEARS OLD"

  ConsoleOutputter.flush

  ConsoleOutputter.move_cursor_up(height)
  sleep 1
end

ConsoleOutputter.move_cursor_down(height)
