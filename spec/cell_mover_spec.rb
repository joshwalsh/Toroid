require "spec_helper"

describe Tordoid::CellMover do
  let(:planet) { mock() }
  subject { Tordoid::CellMover.new planet }

  before(:each) do
    planet.stub(:width).and_return(10)
    planet.stub(:height).and_return(10)
  end

  context 'moves organisms' do
    before(:each) do
      planet.stub(:width).and_return(10)
      planet.stub(:height).and_return(10)

      planet.stub(:[]).with(3,3).and_return 'x'
      planet.stub(:occupied?).and_return(false)
    end

    context 'when able to move' do
      it 'transports from one coordinate to another' do
        planet.should_receive(:[]=).with(1,1,'x')
        planet.should_receive(:[]=).with(3,3,nil)

        subject.transport(3, 3, 1, 1)
      end

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

        expect { subject.move(3, 3, :right) }.to raise_error Tordoid::CellMover::CurrentlyOccupiedError
      end
    end

    context 'at random' do
      it 'does not move when all neighboring cells are occupied' do
        planet.stub(:occupied?).with(2,3).and_return(true)
        planet.stub(:occupied?).with(4,3).and_return(true)
        planet.stub(:occupied?).with(3,2).and_return(true)
        planet.stub(:occupied?).with(3,4).and_return(true)

        subject.should_not_receive(:move)

        subject.move_at_random(3,3)
      end

      it 'moves into neighboring cell when only one is unoccupied' do
        planet.stub(:occupied?).with(2,3).and_return(false)
        planet.stub(:occupied?).with(4,3).and_return(true)
        planet.stub(:occupied?).with(3,2).and_return(true)
        planet.stub(:occupied?).with(3,4).and_return(true)

        subject.should_receive(:transport).with(3,3,2,3)

        subject.move_at_random(3,3)
      end

      it 'moves into neighboring cell when 2 cells are unoccupied' do
        planet.stub(:occupied?).with(2,3).and_return(false)
        planet.stub(:occupied?).with(4,3).and_return(false)
        planet.stub(:occupied?).with(3,2).and_return(true)
        planet.stub(:occupied?).with(3,4).and_return(true)

        Tordoid::SelectRandomCoordinate.stub(:from_set) { [2,3] }
        subject.should_receive(:transport).with(3,3,2,3)

        subject.move_at_random(3,3)
      end

      it 'moves into neighboring cell when all cells are unoccupied' do
        planet.stub(:occupied?).with(2,3).and_return(false)
        planet.stub(:occupied?).with(4,3).and_return(false)
        planet.stub(:occupied?).with(3,2).and_return(false)
        planet.stub(:occupied?).with(3,4).and_return(false)

        Tordoid::SelectRandomCoordinate.stub(:from_set) { [3,4] }
        subject.should_receive(:transport).with(3,3,3,4)

        subject.move_at_random(3,3)
      end
    end
  end

end
