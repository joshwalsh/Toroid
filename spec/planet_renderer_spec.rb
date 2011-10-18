require 'planet_renderer'
require 'planet'

describe "PlanetRenderer" do
  before(:each) do
    @planet = Planet.new 3,3
    @renderer = PlanetRenderer.new @planet
  end

  context "ASCII" do
    it "renders a row" do
      @planet[2,2] = 'x'
      @renderer.render_row(2).should == '. . x'

      @planet[1,2] = 'x'
      @renderer.render_row(2).should == '. x x'
    end

    it "renders a block" do
      @planet[2,2] = 'x'
      @planet[1,2] = 'x'

      @renderer.render.should == ". . .\n. . .\n. x x"
    end
  end
end
