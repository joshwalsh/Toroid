require 'spec_helper'

describe Tordoid::PlanetRenderer do
  let(:renderer) { Tordoid::PlanetRenderer.new planet }

  context "rendering a single row" do
    context "one column" do
      let(:planet) { stub row: [nil, nil, 'x'] }
      it "renders a row" do
        renderer.render_row(2).should == '. . x'
      end
    end

    context "two columns" do
      let(:planet) { stub row: [nil, 'x', 'x'] }
      it "renders a row" do
        renderer.render_row(2).should == '. x x'
      end
    end
  end

  context "rendering a planet" do
    let(:planet) { stub height: 3 }

    it "renders a block" do
      planet.should_receive(:row).with(0).and_return [nil, nil, nil]
      planet.should_receive(:row).with(1).and_return [nil, nil, nil]
      planet.should_receive(:row).with(2).and_return [nil, 'x', 'x']

      renderer.render.should == ". . .\n. . .\n. x x"
    end
  end
end
