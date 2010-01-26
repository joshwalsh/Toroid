require 'planet'

describe Planet do
  before (:each) do
    @planet = Planet.new(10,10)
  end

  context 'is empty' do
    it 'starts with an empty grid' do
      @planet.grid.size.should == 0
    end

    it 'has a 10 x 10 grid' do
      @planet.size.should == 100;
    end
  end

  context 'manipulates the grid' do
    it 'reads empty grid cells' do
      @planet[3,6].should be_nil
    end

    it 'sets a value to a cell' do
      @planet[3,6] = 'barb'
      @planet[3,6].should == 'barb'
    end

    it 'should not allow setting an organism outside the grid' do
      @planet[14,18] = 'barb'
      @planet[14,18].should be_false
    end
  end

  context 'moves organisms around' do
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

    it 'should not allow moving an organism into an occupied cell' do
      @planet[3,5] = 'barb'
      @planet[4,5] = 'steve'
      @planet.move(3, 5, :right)

      @planet[3,5].should == 'barb'
      @planet[4,5].should == 'steve'
    end
  end

  context 'is aware of cell neighbors' do
    it 'should list neighbors of a given cell' do
      @planet.neighbors(3,5).should == [[3,4],[4,5],[3,6],[2,5]]
    end

    it 'should list not list any empty neighbors' do
      @planet[3,4] = 'steve'
      @planet[4,5] = 'jim'
      @planet[3,6] = 'john'
      @planet[2,5] = 'liz'

      @planet.empty_neighbor_cells(3,5).should == []
    end

    it 'should list not list empty top and bottom neighbors' do
      @planet[4,5] = 'jim'
      @planet[2,5] = 'liz'

      @planet.empty_neighbor_cells(3,5).should == [[3,4],[3,6]]
    end

    it 'should list not list empty left and right neighbors' do
      @planet[3,4] = 'jim'
      @planet[3,6] = 'liz'

      @planet.empty_neighbor_cells(3,5).should == [[4,5],[2,5]]
    end
  end
end
