require 'lean_spec_helper'
require 'app/services/cell_in_direction'
require 'app/primitives/point'

describe CellInDirection do
  let(:planet) { mock() }
  subject { CellInDirection.new planet }

  before(:each) do
    planet.stub(:width).and_return(10)
    planet.stub(:height).and_return(10)
  end

  it 'gets cell at the left' do
    subject.left(Point.new(3,3)).should == Point.new(2, 3)
  end

  it 'moves an organism to the right' do
    subject.right(Point.new(3, 3)).should == Point.new(4,3)
  end

  it 'moves an organism down' do
    subject.down(Point.new(3, 3)).should == Point.new(3,4)
  end

  it 'moves an organism up' do
    subject.up(Point.new(3, 3)).should == Point.new(3,2)
  end

  it 'wraps off the left side of the screen' do
    subject.left(Point.new(0, 3)).should == Point.new(9,3)
  end

  it 'wraps off the right side of the screen' do
    subject.right(Point.new(9, 3)).should == Point.new(0,3)
  end

  it 'wraps off the top of the screen' do
    subject.up(Point.new(3, 0)).should == Point.new(3,9)
  end

  it 'wraps off the bottom of the screen' do
    subject.down(Point.new(3, 9)).should == Point.new(3,0)
  end
end