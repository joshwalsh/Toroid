require File.dirname(__FILE__) + '/spec_helper'
require 'game'

describe Game do
  it "should create a planet" do
    @game = Game.new

    @game.planet.should_not be_empty
  end
end
