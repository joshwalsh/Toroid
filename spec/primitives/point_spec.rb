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
end