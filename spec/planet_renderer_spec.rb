require 'planet_renderer'
require 'planet'

describe "PlanetRenderer" do
  before(:each) do
    @planet = Planet.new 3,3
    @renderer = PlanetRenderer.new @planet
  end
  
  context "ASCII" do
    it "should render a row" do
      @planet[2,2] = 'x'
      @renderer.render_row(2).should == '..x'
      
      @planet[1,2] = 'x'
      @renderer.render_row(2).should == '.xx'
    end
  end
end