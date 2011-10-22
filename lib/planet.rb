class Planet
  class OutOfBoundsError < StandardError; end
  attr_reader :width, :height, :generation
  
  def initialize(x, y)
    @width, @height = x, y
    @grid = Hash.new
    @generation = 0
  end

  def [](x,y)
    raise OutOfBoundsError.new if out_of_bounds? x, y

    @grid[[x,y]]
  end

  def []=(x,y,organism)
    raise OutOfBoundsError.new if out_of_bounds? x, y

    if organism.nil?
      @grid.delete [x,y]
    else
      @grid[[x,y]] = organism
    end
  end

  def occupied_cells
    @grid
  end

  def out_of_bounds?(x,y)
    return true if x > (@width - 1)
    return true if y > (@height - 1)
    false
  end
  
  def row(y)
    return_value = []
    
    @width.times do |x|
      return_value.push self[x,y]
    end
    
    return_value
  end
  
  def column(x)
    return_value = []
    
    @height.times do |y|
      return_value.push self[x,y]
    end
    
    return_value
  end

  def occupied?(x, y)
    self[x,y] != nil
  end

  def size
    @width * @height
  end

  def empty?
    @grid.empty?
  end

  def clear
    @grid.clear
  end

  def age(years = 1)
    @generation += years
  end
end
