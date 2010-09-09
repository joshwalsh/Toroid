require 'cell_navigator'
require 'planet'

describe CellNavigator do
  before (:each) do
    @planet = Planet.new(10,10)
    @navigator = CellNavigator.new @planet
  end

  context 'gets cells by direction' do
    it 'gets cell at the left' do
      @navigator.cell_in_direction(3, 3, :left).should == [2,3]
    end

    it 'moves an organism to the right' do
      @navigator.cell_in_direction(3, 3, :right).should == [4,3]
    end

    it 'moves an organism down' do
      @navigator.cell_in_direction(3, 3, :down).should == [3,4]
    end

    it 'moves an organism up' do
      @navigator.cell_in_direction(3, 3, :down).should == [3,4]
    end

    it 'wraps off the left side of the screen' do
      @navigator.cell_in_direction(0, 3, :left).should == [9,3]
    end

    it 'wraps off the right side of the screen' do
      @navigator.cell_in_direction(9, 3, :right).should == [0,3]
    end

    it 'wraps off the top of the screen' do
      @navigator.cell_in_direction(3, 0, :up).should == [3,9]
    end

    it 'wraps off the bottom of the screen' do
      @navigator.cell_in_direction(3, 9, :down).should == [3,0]
    end
  end

  context 'moves organisms' do
    it 'moves an organism to the left' do
      @planet[3,3] = 'x'
      @navigator.move(3, 3, :left)

      @planet[2,3].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'moves an organism to the right' do
      @planet[3,3] = 'x'
      @navigator.move(3, 3, :right)

      @planet[4,3].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'moves an organism down' do
      @planet[3,3] = 'x'
      @navigator.move(3, 3, :down)

      @planet[3,4].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'moves an organism up' do
      @planet[3,3] = 'x'
      @navigator.move(3, 3, :up)

      @planet[3,2].should == 'x'
      @planet[3,3].should be_nil
    end

    it 'does not allow moving an organism into an occupied cell' do
      @planet[3,5] = 'x'
      @planet[4,5] = 'steve'
      @navigator.move(3, 5, :right)

      @planet[3,5].should == 'x'
      @planet[4,5].should == 'steve'
    end
  end

  context 'is aware of cell neighbors' do
    it 'should list neighbors of a given cell' do
      @navigator.neighbors(3,5).should == [[3,4],[4,5],[3,6],[2,5]]
    end

    it 'does not list any empty neighbors' do
      @planet[3,4] = 'steve'
      @planet[4,5] = 'jim'
      @planet[3,6] = 'john'
      @planet[2,5] = 'liz'

      @navigator.empty_neighbor_cells(3,5).should == []
    end

    it 'lists empty top and bottom neighbors' do
      @planet[4,5] = 'jim'
      @planet[2,5] = 'liz'

      @navigator.empty_neighbor_cells(3,5).should == [[3,4],[3,6]]
    end

    it 'lists empty left and right neighbors' do
      @planet[3,4] = 'jim'
      @planet[3,6] = 'liz'

      @navigator.empty_neighbor_cells(3,5).should == [[4,5],[2,5]]
    end
  end
end
