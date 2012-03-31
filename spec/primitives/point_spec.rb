require 'lean_spec_helper'
require 'app/primitives/point'

describe Point do
  subject { Point.new(3,5) }

  context "coordinate values" do
    it "has an X value" do
      subject.x.should == 3
    end

    it "has a Y value" do
      subject.y.should == 5
    end
  end

  context "equality" do
    it "considers points with the same x and y values to be equal" do 
      subject.should == Point.new(3,5)
    end

    it "considers points with different x and y values to be different" do
      subject.should_not == Point.new(3,3)
    end
  end
end