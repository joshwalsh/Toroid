require 'rspec/mocks/standalone'

Given /^there is an organism on the board$/ do
  @game.planet[3,3] = 'barb'
end

Given /^the system will navigate it to an adjacent cell$/ do
  # At it's most basic, this is a way you can instantiate the collaborators and
  # hand them in. I wrote this under sleep deprevation so I'd recommend
  # thinking through where to put this, but it's here for example.

  navigator = Tordoid::CellNavigator.new @game.planet
  navigator.stub(:select_random_coordinate_from_set) { [2,3] }
  @game.cell_navigator = navigator

  # Just a thought, but this smells more like a unit test to me than an
  # integration test when you are stubbing out these internal details.  If I
  # wanted to be able to deterministically test the output of a planet after
  # movement, then it would probably force me to have the CellNavigator take a
  # MovementType subclass. So, you could have a MovementType named RandomWalk,
  # or maybe a movement named AlwaysMoveDown.
  #
  # So, your final application would use the RandomWalk movement type that the
  # CellNavigator would query to decide where to go, but here in your
  # integration test, you could use AlwaysMoveDown. Now you have the
  # determinism you are trying to hard to stub into the underlying system.
  #
  # That's just a gut feeling though. We probably could talk through a better
  # abstraction.
end

Then /^it should not be where it started$/ do
  @game.planet[3,3].should be_nil
end

Then /^it should be moved to an adjacent cell$/ do
  @game.planet[2,3].should == 'barb'
end
