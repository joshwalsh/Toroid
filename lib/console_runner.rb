class ConsoleRunner
  include Toroid::Console

  def initialize
    get_setup_parameters

    @game = Toroid::Game.new @width, @height, @population
    @statistics = Toroid::PlanetStats.new @game.planet
    @renderer = Toroid::PlanetRenderer.new @game.planet
  end

  def run
    new_line
    loop do
      @game.run 1

      render_board
      render_statistics

      flush

      command = prompt_for_command

      exit if command == 'q'

      move_cursor_up(@height + 7)
    end
  end

  def terminate
    move_cursor_down(@height)
  end

  private

  def get_setup_parameters
    @width = Toroid.config.width || request_value("Board width: ").to_i
    @height = Toroid.config.height || request_value("Board height: ").to_i
    @population = Toroid.config.population || request_value("Population: ").to_i
  end

  def render_board
    output @renderer.render
    new_line(3)
  end

  def render_statistics
    output("==" * @width)
    new_line
    output "YEAR: #{@game.planet.year}"
    new_line
    output "POPULATION:: #{@statistics.population}"
    new_line
    output("==" * @width)
    new_line
    output("  " * @width)
    new_line

    move_cursor_up(1)
  end

  def prompt_for_command
    output(">> ")
    gets.strip
  end
end

