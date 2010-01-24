require 'planet'

describe Planet do
  before (:each) do
    @planet = Planet.new(10,10)
  end

  it 'starts with an empty grid' do
    @planet.should be_empty
  end

  it 'has a 10 x 10 grid' do
    @planet.size.should == 100;
  end

  it 'determines grid location for coordinates' do
    @planet.determine_key_for_coordinate(0,0).should == 0
    @planet.determine_key_for_coordinate(5,0).should == 5
    @planet.determine_key_for_coordinate(1,3).should == 31
    @planet.determine_key_for_coordinate(8,4).should == 48
  end

  it 'reads empty grid cells' do
    @planet[3,6].should be_nil
  end

  it 'sets a value to a cell' do
    @planet[3,6] = 'barb'
    @planet[3,6].should == 'barb'
  end
end
