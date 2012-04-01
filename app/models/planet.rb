class Planet
  include ActiveModel::Validations  
  include ActiveModel::Conversion  
  extend ActiveModel::Naming 

  attr_accessor :name
  attr_accessor :birth_year
  attr_accessor :organisms

  def initialize(game)
    @birth_year = game.year
    @organisms = []
  end

  def width
    @width.to_i
  end

  def height
    @height.to_i
  end

  def to_param
    @name.parameterize
  end

  def size
    @width * @height
  end

  def persisted?
    not @name.nil?
  end
end
