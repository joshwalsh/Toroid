class Planet
  attr_accessor :name
  attr_accessor :width, :height
  attr_accessor :birth_year
  attr_accessor :organisms

  def initialize(game)
    @birth_year = game.year
    @organisms = []
  end

  def to_param
    @name.parameterize
  end

  def size
    @width * @height
  end
end
