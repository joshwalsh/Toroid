require 'planet'

describe Planet do
  before (:each) do
    @planet = Planet.new(10,10)
  end

  context 'is empty' do
    it 'starts with an empty grid' do
      @planet.should be_empty
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
      @planet[3,6] = 'x'
      @planet[3,6].should == 'x'
    end

    it 'does not allow setting an organism outside the grid' do
      lambda {
        @planet[14,18] = 'x'
      }.should raise_error(Planet::OutOfBoundsError)
    end

    it 'returns nil outside the grid' do
      lambda {
        @planet[14,18]
      }.should raise_error(Planet::OutOfBoundsError)
    end

    it 'removes an organism from the grid' do
      @planet[3,6] = 'x'
      @planet[3,6] = nil
      
      @planet.should be_empty
    end
  end

  context 'moves organisms around' do
    it 'moves an organism to the left' do
      @planet[3,3] = 'x'
      @planet.move(3, 3, :left)

      @planet[2,3].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'moves an organism to the right' do
      @planet[3,3] = 'x'
      @planet.move(3, 3, :right)

      @planet[4,3].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'moves an organism down' do
      @planet[3,3] = 'x'
      @planet.move(3, 3, :down)

      @planet[3,4].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'moves an organism up' do
      @planet[3,3] = 'x'
      @planet.move(3, 3, :up)

      @planet[3,2].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'wraps off the left side of the screen' do
      @planet[0,3] = 'x'
      @planet.move(0, 3, :left)

      @planet[9,3].should == 'x'
      @planet[0,3].should be_nil
    end

    it 'wraps off the right side of the screen' do
      @planet[9,3] = 'x'
      @planet.move(9, 3, :right)

      @planet[0,3].should == 'x'
      @planet[9,3].should be_nil
    end

    it 'wraps off the top of the screen' do
      @planet[3,0] = 'x'
      @planet.move(3, 0, :up)

      @planet[3,9].should == 'x'
      @planet[5,0].should be_nil
    end

    it 'wraps off the bottom of the screen' do
      @planet[3,9] = 'x'
      @planet.move(3, 9, :down)

      @planet[3,0].should == 'x'
      @planet[3,9].should be_nil
    end

    it 'does not allow moving an organism into an occupied cell' do
      @planet[3,5] = 'x'
      @planet[4,5] = 'steve'
      @planet.move(3, 5, :right)

      @planet[3,5].should == 'x'
      @planet[4,5].should == 'steve'
    end
  end

  context 'is aware of cell neighbors' do
    it 'should list neighbors of a given cell' do
      @planet.neighbors(3,5).should == [[3,4],[4,5],[3,6],[2,5]]
    end

    it 'does not list any empty neighbors' do
      @planet[3,4] = 'steve'
      @planet[4,5] = 'jim'
      @planet[3,6] = 'john'
      @planet[2,5] = 'liz'

      @planet.empty_neighbor_cells(3,5).should == []
    end

    it 'lists empty top and bottom neighbors' do
      @planet[4,5] = 'jim'
      @planet[2,5] = 'liz'

      @planet.empty_neighbor_cells(3,5).should == [[3,4],[3,6]]
    end

    it 'lists empty left and right neighbors' do
      @planet[3,4] = 'jim'
      @planet[3,6] = 'liz'

      @planet.empty_neighbor_cells(3,5).should == [[4,5],[2,5]]
    end
    
    context "iterates itself" do
      it 'lists the cells in a row' do
        @planet[0,2] = 'x'
        @planet.row(2).should == ['x',nil,nil,nil,nil,nil,nil,nil,nil,nil]
      end
      
      it "lists the cells in a column" do
        @planet[2,0] = 'x'
        @planet.column(2).should == ['x',nil,nil,nil,nil,nil,nil,nil,nil,nil]
      end 
    end

    context "understands the population" do
      it "lists the occupied cells" do
        @planet[0,1] = 'x'
        @planet[0,2] = 'x'

        @planet.occupied_cells.should == {[0,1] => 'x', [0,2] => 'x'}
      end
    end
  end
end
