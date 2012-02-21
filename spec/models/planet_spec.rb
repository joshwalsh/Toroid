require 'spec_helper'

describe Planet do
  let(:game) {
    game = double('game')
    Game.stub(:current => game)
    game
  }
  subject { 
    Planet.new(name: "Earth", width: 10, height: 10)
  }
 
  context "Age" do
    it "records the year of its birth" do
      game.stub(:year => 3)

      subject.save
      subject.birth_year.should eq(3)
    end

    it "knows it's age" do
      game.stub(:year => 10)

      subject.birth_year = 3
      subject.age.should eq(7)
    end
  end

  context "Size" do
    it "has a size of 100 when width and height are 10" do
      subject.width = 10
      subject.height = 10
      subject.size.should eq(100)
    end
  end

  context "Organism Placement" do
    let(:organism) { Organism.new name: "josh" }

    it "places an organism by coordinate and adds to organisms collection" do
      subject.place_organism(5, 5, organism)
      subject.organisms.should include(organism)
    end

    it "finds an organism by coordinate" do
      subject.place_organism(5, 5, organism)
      subject.organisms.find_by_coordinate(5,5).should eq(organism)
    end

    it "doesn't find an organism when coordinate is wrong" do
      subject.place_organism(5, 5, organism)
      subject.organisms.find_by_coordinate(3,3).should be_nil
    end
  end
end