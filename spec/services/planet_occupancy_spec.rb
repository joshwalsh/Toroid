require 'spec_helper'

describe PlanetOccupancy do
  subject {
    PlanetOccupancy.new(planet)
  }

  let(:planet) { Planet.new(name: "Earth", width: 10, height: 10) }

  context "Organism Placement" do
    let(:organism) { Organism.new name: "josh" }

    it "places an organism by coordinate and adds to organisms collection" do
      subject.place_organism(5, 5, organism)
      planet.organisms.should include(organism)
    end

    it "finds an organism by coordinate" do
      subject.place_organism(5, 5, organism)
      planet.organisms.find_by_coordinate(5,5).should eq(organism)
    end

    it "doesn't find an organism when coordinate is wrong" do
      subject.place_organism(5, 5, organism)
      planet.organisms.find_by_coordinate(3,3).should be_nil
    end
  end
end