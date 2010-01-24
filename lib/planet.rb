class Planet
  def initialize(x = 10, y = 10)
    @size = x * y
  end

  def empty?
    true
  end

  def size
    @size
  end
end
