require 'planet'

describe Planet do
  before (:each) do
    @planet = Planet.new(10,10)
  end

  it 'starts with an empty grid' do
    @planet.grid.size.should == 0
  end

  it 'has a 10 x 10 grid' do
    @planet.size.should == 100;
  end

  it 'determines grid location for coordinates' do
    @planet.key_for_coordinate(0,0).should == 0
    @planet.key_for_coordinate(5,0).should == 5
    @planet.key_for_coordinate(1,3).should == 31
    @planet.key_for_coordinate(8,4).should == 48
  end

  it 'reads empty grid cells' do
    @planet[3,6].should be_nil
  end

  it 'sets a value to a cell' do
    @planet[3,6] = 'barb'
    @planet[3,6].should == 'barb'
  end

  it 'should move an organism to the left' do
    @planet[3,3] = 'barb'
    @planet.move(3, 3, :left)

    @planet[2,3].should == 'barb'
    @planet[3,3].should be_nil
  end

  it 'should move an organism to the right' do
    @planet[3,3] = 'barb'
    @planet.move(3, 3, :right)

    @planet[4,3].should == 'barb'
    @planet[3,3].should be_nil
  end

  it 'should move an organism down' do
    @planet[3,3] = 'barb'
    @planet.move(3, 3, :down)

    @planet[3,4].should == 'barb'
    @planet[3,3].should be_nil
  end

  it 'should move an organism up' do
    @planet[3,3] = 'barb'
    @planet.move(3, 3, :up)

    @planet[3,2].should == 'barb'
    @planet[3,3].should be_nil
  end

  it 'should wrap off the left side of the screen' do
    @planet[0,3] = 'barb'
    @planet.move(0, 3, :left)

    @planet[9,3].should == 'barb'
    @planet[0,3].should be_nil
  end

  it 'should wrap off the right side of the screen' do
    @planet[9,3] = 'barb'
    @planet.move(9, 3, :right)

    @planet[0,3].should == 'barb'
    @planet[9,3].should be_nil
  end

  it 'should wrap off the top of the screen' do
    @planet[3,0] = 'barb'
    @planet.move(3, 0, :up)

    @planet[3,9].should == 'barb'
    @planet[5,0].should be_nil
  end

  it 'should wrap off the bottom of the screen' do
    @planet[3,9] = 'barb'
    @planet.move(3, 9, :down)

    @planet[3,0].should == 'barb'
    @planet[3,9].should be_nil
  end
end
