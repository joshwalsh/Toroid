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

    it 'does not allow reading outside the grid' do
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

    it "counts occupied cells" do
      @planet[0,1] = 'x'
      @planet[0,2] = 'x'
      @planet[1,1] = 'x'
      @planet[2,2] = 'x'

      @planet.occupied_cells.count.should == 4
    end
  end
end
