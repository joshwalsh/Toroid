require 'planet'

describe Planet do
  it 'should start with an empty grid' do
    @planet = Planet.new
    @planet.should be_empty
  end

  it 'should have a 10 x 10 grid' do
    @planet = Planet.new(10,10)
    @planet.size.should == 100;
  end
end
