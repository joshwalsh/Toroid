require 'yaml'
require 'pathname'
#require 'tordoid/select_random_coordinate'

module Tordoid
  autoload :CellNavigator, "tordoid/cell_navigator"
  autoload :CellMover, "tordoid/cell_mover"
  autoload :Config, "tordoid/config"
  autoload :ConsoleOutputter, "tordoid/console_outputter"
  autoload :Planet, "tordoid/planet"
  autoload :Game, "tordoid/game"
  autoload :PlanetPopulator, "tordoid/planet_populator"
  autoload :PlanetRenderer, "tordoid/planet_renderer"
  autoload :SelectRandomCoordinate, "tordoid/select_random_coordinate"

  def self.app_root
    Pathname.new File.expand_path(File.dirname(__FILE__) + "/../")
  end

  def self.config
    @config ||= Config.new YAML.load_file(app_root.join "config.yml")
  end
end
