require 'spec_helper'

describe Toroid::PlanetPopulator do
  context "populating with known coordinates" do
    let(:planet) { stub Hash.new, width: 10, height: 10 }

    before do
      subject.stub(:generate_random_coordinate).and_return(*coordinates)
      subject.stub create_organism: 'x'
    end

    describe "3x3 board, 1 organism" do
      let(:coordinates) { [[0,0]] }
      it "populates 1 space" do
        subject.stub generate_random_coordinate: [0,0]

        subject.populate(1, planet)[[0,0]].should == 'x'
      end
    end

    describe "3x3 board, 2 organisms" do
      let(:coordinates) { [[0,0], [0,1]] }
      it "populates 2 spaces" do
        subject.populate(2, planet).should eq({ [0,0] => 'x', [0,1] => 'x' })
      end
    end

    describe "3x3 board, 3 organisms" do
      let(:coordinates) { [[0,0], [0,1], [0,2]] }
      it "populates 3 spaces" do
        subject.populate(3, planet).should eq({ [0,0] => 'x', [0,1] => 'x', [0,2] => 'x' })
      end
    end

    context "with duplicate generated coordinate" do
      let(:coordinates) { [[0,0],[0,0],[0,1], [0,2]] }
      it "populates 3 spaces" do
        subject.populate(3, planet).should eq({ [0,0] => 'x', [0,1] => 'x', [0,2] => 'x' })
      end
    end
  end

  context "populating with random coordinates" do
    let(:planet) { stub Hash.new, width: 10, height: 10 }

    before do
      subject.stub create_organism: 'x'
    end

    describe "3x3 board, 1 organism" do
      it "populates 1 space" do
        subject.populate(1, planet).values.should eq(['x'])
      end
    end

    describe "3x3 board, 2 organisms" do
      it "populates 2 spaces" do
        subject.populate(2, planet).values.should eq(['x', 'x'])
      end
    end
  end
end
