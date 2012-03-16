require 'lean_spec_helper'
require "app/services/planet_occupancy"
require "app/models/game"
require "app/models/planet"
require "app/models/organism"
require "app/primitives/point"

describe PlanetOccupancy do
  subject {
    PlanetOccupancy.new(planet)
  }

  let(:game) { 
    g = Game.new 
    g.stub(:year => 1)
    g
  }
  let(:planet) { Planet.new game}
  let(:organism) { Organism.new }

  context "Organism Placement" do
    it "places an organism by coordinate and adds to organisms collection" do
      subject.place_organism(Point.new(5, 5), organism)
      planet.organisms.should include(organism)
    end

    it "finds an organism by coordinate" do
      subject.place_organism(Point.new(5, 5), organism)
      subject.find_by_coordinate(Point.new(5,5)).should eq(organism)
    end

    it "doesn't find an organism when coordinate is wrong" do
      subject.place_organism(Point.new(5, 5), organism)
      subject.find_by_coordinate(Point.new(3,3)).should be_nil
    end
  end

  context "Organism Movement" do
    it "moves from one coordinate to another" do
      subject.place_organism(Point.new(5, 5), organism)
      subject.move_organism(organism, Point.new(5, 4))
      organism.y.should == 4
    end
  end
end