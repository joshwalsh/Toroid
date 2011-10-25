require 'yaml'
require 'config'
require 'pathname'

module Tordoid
  def self.app_root
    Pathname.new File.expand_path(File.dirname(__FILE__) + "/../")
  end

  def self.config
    @config ||= Config.new YAML.load_file(app_root.join "config.yml")
  end
end
