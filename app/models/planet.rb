class Planet
  attr_accessor :name
  attr_accessor :width, :height
  attr_accessor :birth_year
  attr_accessor :organisms

  def initialize(game)
    @game = game
    @birth_year = game.year
    @organisms = []
  end

  def size
    @width * @height
  end

  def age
    @game.year - birth_year
  end
end
