require 'spec_helper'

describe Planet do
  subject { Planet.new }

  context "Size" do
    it "has a size of 100 when width and height are 10" do
      subject.width = 10
      subject.height = 10
      subject.size.should eq(100)
    end
  end
end
