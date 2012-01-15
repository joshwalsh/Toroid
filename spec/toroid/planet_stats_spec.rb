require 'spec_helper'

describe Toroid::PlanetStats do
  let(:planet) { Toroid::Planet.new(10,10) }
  subject { Toroid::PlanetStats.new planet }

  describe '#population' do 
    it "reports the number of organisms on the planet" do
      planet[0,1] = 'x'
      planet[0,2] = 'x'
      planet[1,1] = 'x'
      planet[2,2] = 'x'

      subject.population.should == 4
    end
  end
end
