module Toroid
  class CellMover
    class CurrentlyOccupiedError < StandardError; end

    attr_accessor :cell_navigator

    def initialize(planet)
      @planet = planet
    end

    def cell_navigator
      @cell_navigator ||= CellNavigator.new @planet
    end

    def transport(x, y, new_x, new_y)
      @planet[new_x, new_y] = @planet[x, y]
      @planet[x,y] = nil
    end

    def move(x, y, direction)
      new_x, new_y = cell_navigator.cell_in_direction(x, y, direction)

      if @planet.occupied? new_x, new_y
        raise CurrentlyOccupiedError
      end

      transport(x, y, new_x, new_y)
    end

    def move_at_random(x, y)
      empty_neighbor_cells = cell_navigator.empty_neighbor_cells(x, y)
      return false if empty_neighbor_cells == []

      new_x, new_y = Toroid::SelectRandomCoordinate.from_set empty_neighbor_cells

      transport(x, y, new_x, new_y)
    end
  end
end
