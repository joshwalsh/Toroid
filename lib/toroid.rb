require 'yaml'
require 'pathname'

module Toroid
  autoload :CellNavigator, "toroid/cell_navigator"
  autoload :CellMover, "toroid/cell_mover"
  autoload :Config, "toroid/config"
  autoload :Console, "toroid/console"
  autoload :Planet, "toroid/planet"
  autoload :Game, "toroid/game"
  autoload :PlanetPopulator, "toroid/planet_populator"
  autoload :PlanetRenderer, "toroid/planet_renderer"
  autoload :PlanetStats, "toroid/planet_stats"
  autoload :SelectRandomCoordinate, "toroid/select_random_coordinate"

  def self.app_root
    Pathname.new File.expand_path(File.dirname(__FILE__) + "/../")
  end

  def self.config
    @config ||= Config.new YAML.load_file(app_root.join "config.yml")
  end
end
