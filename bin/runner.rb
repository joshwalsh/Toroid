#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"
require 'tordoid'

width = Tordoid.config.width || Tordoid::ConsoleOutputter.request_value("Board width: ").to_i
height = Tordoid.config.height || Tordoid::ConsoleOutputter.request_value("Board height: ").to_i
population = Tordoid.config.population || Tordoid::ConsoleOutputter.request_value("Population: ").to_i

trap "INT" do
  Tordoid::ConsoleOutputter.move_cursor_down(height)
  exit
end

Tordoid::ConsoleOutputter.new_line

session = Tordoid::Game.new width, height, population

loop do
  session.run 1
  render = Tordoid::PlanetRenderer.new session.planet

  Tordoid::ConsoleOutputter.output render.render
  Tordoid::ConsoleOutputter.new_line
  Tordoid::ConsoleOutputter.output "#{session.planet.generation} YEARS OLD"

  Tordoid::ConsoleOutputter.flush

  Tordoid::ConsoleOutputter.move_cursor_up(height)
  gets
  Tordoid::ConsoleOutputter.move_cursor_up(1)
end
