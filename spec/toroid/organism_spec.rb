require 'spec_helper'

describe Toroid::Organism do  
  context "new planet" do
    subject { Toroid::Organism.new planet}
    let(:planet) { Toroid::Planet.new(10,10) }
  
    it "renders as an 'x'" do
      subject.render.should == 'x'
    end
  end
  
  context "existing planet" do
    before(:each) do
      @planet = Toroid::Planet.new(10,10) 
      @planet.age 5
      
      @organism = Toroid::Organism.new @planet
    end
          
    it "knows what year it was born" do
      @planet.age 5
      @organism.age.should == 5
    end
    
    it "knows it's age based off the current year and when it was created" do
      @planet.age 6
      @organism.age.should == 6
    end    
  end

end