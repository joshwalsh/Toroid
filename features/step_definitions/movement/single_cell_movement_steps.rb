Given /^there is an organism on the board$/ do
  @game = Game.new 
  @game.planet[3,3] = 'barb'
end

When /^and it is able to move$/ do
  @game.planet.move(3, 3, :left)
end

Then /^it should move$/ do
  @game.planet[2,3].should == 'barb'
  @game.planet[3,3].should be_nil
end
