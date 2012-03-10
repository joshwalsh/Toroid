require 'lean_spec_helper'
require 'app/services/calculate_age'

describe CalculateAge do
  let(:game) {
    double('game')
  }
  let(:planet) {
    p = double('planet')
    p
  }

  it "knows it's age" do
    game.stub(:year => 10)
    planet.stub(:birth_year => 3)

    CalculateAge.for_year(game.year, planet).should eq(7)
  end
end