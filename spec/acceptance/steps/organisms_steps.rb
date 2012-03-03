require 'rspec/mocks/standalone'

steps_for :organisms do
  step "the system will navigate the organism at :from_x, :from_y to :to_x, :to_y" do |from_x, from_y, to_x, to_y|
    @planet_occupancy = PlanetOccupancy.new @planet
    @organism = @planet_occupancy.organism_at_coordinate(from_x, from_y)

    PlanetOccupancy.any_instance.stub(:select_random_adjacent_coordinate) { [to_x, to_y] }
  end

  step "the organism should not be at :x, :y" do |x, y|
    @planet_occupancy.organism_at_coordinate(x, y).should be_nil
  end

  step "the organism should be at :x, :y" do |x, y|
    @planet_occupancy.organism_at_coordinate(x, y).should == @organism
  end
end