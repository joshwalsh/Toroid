#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"

require 'game'
require 'planet'
require 'planet_populator'
require 'planet_renderer'
require 'console_outputter'

ConsoleOutputter.output "Board width: "
width = gets.to_i
ConsoleOutputter.output "Board height: "
height = gets.to_i
ConsoleOutputter.output "Population: "
population = gets.to_i
ConsoleOutputter.output "Years: "
years = gets.to_i

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
