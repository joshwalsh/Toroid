require "spec_helper"

describe Tordoid::CellNavigator do
  let(:planet) { mock() }
  subject { Tordoid::CellNavigator.new planet }

  before(:each) do
    planet.stub(:width).and_return(10)
    planet.stub(:height).and_return(10)
  end

  context 'gets cells by direction' do
    it 'gets cell at the left' do
      subject.cell_in_direction(3, 3, :left).should == [2,3]
    end

    it 'moves an organism to the right' do
      subject.cell_in_direction(3, 3, :right).should == [4,3]
    end

    it 'moves an organism down' do
      subject.cell_in_direction(3, 3, :down).should == [3,4]
    end

    it 'moves an organism up' do
      subject.cell_in_direction(3, 3, :down).should == [3,4]
    end

    it 'wraps off the left side of the screen' do
      subject.cell_in_direction(0, 3, :left).should == [9,3]
    end

    it 'wraps off the right side of the screen' do
      subject.cell_in_direction(9, 3, :right).should == [0,3]
    end

    it 'wraps off the top of the screen' do
      subject.cell_in_direction(3, 0, :up).should == [3,9]
    end

    it 'wraps off the bottom of the screen' do
      subject.cell_in_direction(3, 9, :down).should == [3,0]
    end
  end

  context 'moves organisms' do
    before(:each) do
      planet.stub(:width).and_return(10)
      planet.stub(:height).and_return(10)

      planet.stub(:[]).with(3,3).and_return 'x'
      planet.stub(:occupied?).and_return(false)
    end

    context 'when able to move' do
      it 'moves an organism to the left' do
        planet.should_receive(:[]=).with(2,3,'x')
        planet.should_receive(:[]=).with(3,3,nil)

        subject.move(3, 3, :left)
      end

      it 'moves an organism to the right' do
        planet.should_receive(:[]=).with(4,3,'x')
        planet.should_receive(:[]=).with(3,3,nil)

        subject.move(3, 3, :right)
      end

      it 'moves an organism down' do
        planet.should_receive(:[]=).with(3,4,'x')
        planet.should_receive(:[]=).with(3,3,nil)

        subject.move(3, 3, :down)
      end

      it 'moves an organism up' do
        planet.should_receive(:[]=).with(3,2,'x')
        planet.should_receive(:[]=).with(3,3,nil)

        subject.move(3, 3, :up)
      end
    end

    context 'when not able to move' do
      it 'does not allow moving an organism into an occupied cell' do
        planet.stub(:occupied?).and_return(true)
        planet.stub(:[]).with(2,3).and_return 'steve'

        lambda { subject.move(3, 3, :right).should raise_error CurrentlyOccupiedError }
      end
    end

    context 'at random' do
      it 'does not move when all neighboring cells are occupied' do
        planet.stub(:occupied?).with(3,4).and_return(true)
        planet.stub(:occupied?).with(4,5).and_return(true)
        planet.stub(:occupied?).with(3,6).and_return(true)
        planet.stub(:occupied?).with(2,5).and_return(true)

        planet.should_not_receive(:[]=).with(3,4,'x')
        planet.should_not_receive(:[]=).with(4,5,'x')
        planet.should_not_receive(:[]=).with(3,6,'x')
        planet.should_not_receive(:[]=).with(2,5,'x')

        subject.move_at_random(3,3).should == false
      end
    end
  end

  context 'is aware of cell neighbors' do
    it 'should list neighbors of a given cell' do
      subject.neighbors(3,5).should == [[3,4],[4,5],[3,6],[2,5]]
    end

    it 'does not list any empty neighbors' do
      planet.stub(:occupied?).with(3,4).and_return(true)
      planet.stub(:occupied?).with(4,5).and_return(true)
      planet.stub(:occupied?).with(3,6).and_return(true)
      planet.stub(:occupied?).with(2,5).and_return(true)

      subject.empty_neighbor_cells(3,5).should == []
    end

    it 'lists empty top and bottom neighbors' do
      planet.stub(:occupied?).with(3,4).and_return(false)
      planet.stub(:occupied?).with(3,6).and_return(false)

      planet.stub(:occupied?).with(4,5).and_return(true)
      planet.stub(:occupied?).with(2,5).and_return(true)

      subject.empty_neighbor_cells(3,5).should == [[3,4],[3,6]]
    end

    it 'lists empty left and right neighbors' do
      planet.stub(:occupied?).with(3,4).and_return(true)
      planet.stub(:occupied?).with(3,6).and_return(true)

      planet.stub(:occupied?).with(4,5).and_return(false)
      planet.stub(:occupied?).with(2,5).and_return(false)

      subject.empty_neighbor_cells(3,5).should == [[4,5],[2,5]]
    end
  end

end
