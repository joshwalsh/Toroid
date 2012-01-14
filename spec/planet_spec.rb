require 'spec_helper'

describe Tordoid::Planet do
  subject { Tordoid::Planet.new(10,10) }

  context 'is empty' do
    it { should be_empty }

    it 'has a 10 x 10 grid' do
      subject.size.should == 100;
    end
  end

  context 'manipulates the grid' do
    it 'reads empty grid cells' do
      subject[3,6].should be_nil
    end

    it 'sets a value to a cell' do
      subject[3,6] = 'x'
      subject[3,6].should == 'x'
    end

    it 'does not allow setting an organism outside the grid' do
      lambda {
        subject[14,18] = 'x'
      }.should raise_error(Tordoid::Planet::OutOfBoundsError)
    end

    it 'does not allow reading outside the grid' do
      lambda {
        subject[14,18]
      }.should raise_error(Tordoid::Planet::OutOfBoundsError)
    end

    it 'removes an organism from the grid' do
      subject[3,6] = 'x'
      subject[3,6] = nil

      subject.should be_empty
    end
  end

  context "iterates itself" do
    it 'lists the cells in a row' do
      subject[0,2] = 'x'
      subject.row(2).should == ['x',nil,nil,nil,nil,nil,nil,nil,nil,nil]
    end

    it "lists the cells in a column" do
      subject[2,0] = 'x'
      subject.column(2).should == ['x',nil,nil,nil,nil,nil,nil,nil,nil,nil]
    end 
  end

  context "understands the population" do
    it "lists the occupied cells" do
      subject[0,1] = 'x'
      subject[0,2] = 'x'

      subject.occupied_cells.should == {[0,1] => 'x', [0,2] => 'x'}
    end

    it "counts occupied cells" do
      subject[0,1] = 'x'
      subject[0,2] = 'x'
      subject[1,1] = 'x'
      subject[2,2] = 'x'

      subject.occupied_cells.count.should == 4
    end
  end

  context "generations" do
    it "ages over time" do
      subject.age 3
      subject.generation.should == 3
    end
  end
end
