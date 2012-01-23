require 'spec_helper'

describe Toroid::Organism do  
  subject { Toroid::Organism.new }

  it "renders as an 'x'" do
    subject.render.should == 'x'
  end
end
