module Toroid
  class SelectRandomCoordinate
      def self.from_set(set_of_coordinates)
        selected_coordinate = set_of_coordinates.sample
        [selected_coordinate[0], selected_coordinate[1]]
      end
  end
end
