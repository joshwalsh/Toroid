require 'lean_spec_helper'
require 'app/services/cell_in_direction'

describe CellInDirection do
  let(:planet) { mock() }
  subject { CellInDirection.new planet }

  before(:each) do
    planet.stub(:width).and_return(10)
    planet.stub(:height).and_return(10)
  end

  it 'gets cell at the left' do
    subject.left(3, 3).should == [2,3]
  end

  it 'moves an organism to the right' do
    subject.right(3, 3).should == [4,3]
  end

  it 'moves an organism down' do
    subject.down(3, 3).should == [3,4]
  end

  it 'moves an organism up' do
    subject.up(3, 3).should == [3,2]
  end

  it 'wraps off the left side of the screen' do
    subject.left(0, 3).should == [9,3]
  end

  it 'wraps off the right side of the screen' do
    subject.right(9, 3).should == [0,3]
  end

  it 'wraps off the top of the screen' do
    subject.up(3, 0).should == [3,9]
  end

  it 'wraps off the bottom of the screen' do
    subject.down(3, 9).should == [3,0]
  end
end