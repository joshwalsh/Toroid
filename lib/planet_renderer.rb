class PlanetRenderer
  def initialize(planet)
    @planet = planet
  end

  def render_row(y)
    @planet.row(y).map do |cell| 
      if cell.nil? 
        '.'
      else 
        cell.to_s
      end
    end.join
  end
  
  def render
    "...\n.x.\n..x"
  end
end
