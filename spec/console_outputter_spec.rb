require 'spec_helper'

describe Tordoid::ConsoleOutputter do
  it "flushes the output" do
    STDOUT.should_receive(:flush)
    Tordoid::ConsoleOutputter.flush
  end

  context 'simple output' do
    it "writes anything given to the output" do
      Tordoid::ConsoleOutputter.should_receive(:print).with("Tordoid")
      Tordoid::ConsoleOutputter.output "Tordoid"
    end

    it "writes a new line" do
      Tordoid::ConsoleOutputter.should_receive(:print).with("\n")
      Tordoid::ConsoleOutputter.new_line
    end
  end

  context 'cursor movement' do
    it "moves the cursor up by line" do
      Tordoid::ConsoleOutputter.should_receive(:print).with("\e[10A\r")
      Tordoid::ConsoleOutputter.move_cursor_up(10)
    end

    it "moves the cursor down by line" do
      Tordoid::ConsoleOutputter.should_receive(:print).with("\e[10B\r")
      Tordoid::ConsoleOutputter.move_cursor_down(10)
    end
  end

  context 'asking for input' do
    it 'requests a value' do
      Tordoid::ConsoleOutputter.stub(:gets).and_return('25')
      Tordoid::ConsoleOutputter.should_receive(:print).with('Enter Value: ')
      Tordoid::ConsoleOutputter.request_value("Enter Value: ")
    end

    it 'receives a requested value' do
      Tordoid::ConsoleOutputter.stub(:gets).and_return('25')
      Tordoid::ConsoleOutputter.request_value("Enter Value: ").should == "25"
    end
  end
end
