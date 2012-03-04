require "lean_spec_helper"
require "app/services/persist_game"

describe PersistGame do
  it "writes the game file to db/environment.yml" do
    Rails = mock()
    Rails.stub(:root => "foo")
    Rails.stub(:env => "env")
    PersistGame.FilePath.should == "foo/db/env.yml"
  end
end