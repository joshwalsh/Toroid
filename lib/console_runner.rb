class ConsoleRunner
  include Toroid::Console

  def main
    width = Toroid.config.width || request_value("Board width: ").to_i
    height = Toroid.config.height || request_value("Board height: ").to_i
    population = Toroid.config.population || request_value("Population: ").to_i

    trap "INT" do
      move_cursor_down(height)
      exit
    end

    game = Toroid::Game.new width, height, population
    statistics = Toroid::PlanetStats.new game.planet

    new_line
    loop do
      game.run 1
      render = Toroid::PlanetRenderer.new game.planet

      output render.render
      new_line(3)
      output("==" * width)
      new_line
      output "YEAR: #{game.planet.year}"
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

