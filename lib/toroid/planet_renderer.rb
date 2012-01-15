module Toroid
  class PlanetRenderer
    def initialize(planet)
      @planet = planet
    end

    def render_row(y)
      @planet.row(y).map do |cell| 
        if cell.nil? 
          '. '
        else 
          cell.to_s + ' '
        end
      end.join.strip
    end

    def render
      (0...@planet.height).map do |row|
        render_row(row)
      end.join("\n")
    end
  end
end
