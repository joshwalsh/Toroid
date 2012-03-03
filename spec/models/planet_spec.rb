require 'lean_spec_helper'
require 'app/models/planet'
require 'app/models/game'

describe Planet do
  let(:game) {
    g = double('game')
    g.stub(:year => 1)
    g
  }
  subject { 
    p = Planet.new(game)
    p.name = "Earth"
    p
  }
 
  context "Age" do
    it "records the year of its birth" do
      game.stub(:year => 3)
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
end