#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"
require 'tordoid'

class Runner
  include Tordoid::ConsoleOutput

  def main
    width = Tordoid.config.width || request_value("Board width: ").to_i
    height = Tordoid.config.height || request_value("Board height: ").to_i
    population = Tordoid.config.population || request_value("Population: ").to_i

    trap "INT" do
      move_cursor_down(height)
      exit
    end

    game = Tordoid::Game.new width, height, population
    statistics = Tordoid::PlanetStats.new game.planet

    new_line
    loop do
      game.run 1
      render = Tordoid::PlanetRenderer.new game.planet

      output render.render
      new_line(3)
      output("==" * width)
      new_line
      output "GENERATION: #{game.planet.generation}"
      new_line
      output "POPULATION:: #{statistics.population}"
      new_line
      output("==" * width)
      new_line
      output("  " * width)
      new_line
      move_cursor_up(1)
      output(">> ")
      flush

      gets
      move_cursor_up(height)
      move_cursor_up(7)
    end
  end
end

Runner.new.main
