require 'rspec/mocks/standalone'

steps_for :organisms do
  step "the system will navigate the organism at :from_x, :from_y to :to_x, :to_y" do |from_x, from_y, to_x, to_y|
    @planet_occupancy = PlanetOccupancy.new @planet
    @organism = @planet_occupancy.find_by_coordinate(Point.new(from_x, from_y))

    PlanetOccupancy.any_instance.stub(:select_random_adjacent_coordinate) { Point.new(to_x, to_y) }
  end
end