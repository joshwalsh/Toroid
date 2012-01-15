module Toroid
  class Config
    attr_reader :width, :height, :population, :years

    def initialize(settings)
      @width = settings['width']
      @height = settings['height']
      @population = settings['population']
      @years = settings['years']
    end
  end
end
