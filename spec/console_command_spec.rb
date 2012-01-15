require 'spec_helper'

describe ConsoleCommand do
  it "terminates when given 'q'" do
    command = ConsoleCommand.new 'q'
    command.terminated?.should == true
  end

  it "doesn't terminates when given blank ''" do
    command = ConsoleCommand.new ''
    command.terminated?.should == false
  end
end
