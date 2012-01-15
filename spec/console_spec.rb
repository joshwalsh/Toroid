require 'spec_helper'

class ConsoleOutputTest
  include Toroid::Console
end

describe Toroid::Console do

  subject { ConsoleOutputTest.new }

  it "flushes the output" do
    STDOUT.should_receive(:flush)
    subject.flush
  end

  context 'simple output' do
    it "writes anything given to the output" do
      STDOUT.should_receive(:print).with("toroid")
      subject.output "toroid"
    end

    it "writes a new line" do
      STDOUT.should_receive(:print).with("\n")
      subject.new_line
    end

    it "writes multiple new lines" do
      STDOUT.should_receive(:print).with("\n\n\n")
      subject.new_line(3)
    end
  end

  context 'cursor movement' do
    it "moves the cursor up by line" do
      STDOUT.should_receive(:print).with("\e[10A\r")
      subject.move_cursor_up(10)
    end

    it "moves the cursor down by line" do
      STDOUT.should_receive(:print).with("\e[10B\r")
      subject.move_cursor_down(10)
    end
  end

  context 'asking for input' do
    it 'requests a value' do
      STDIN.stub(:gets).and_return('25')
      STDOUT.should_receive(:print).with('Enter Value: ')
      subject.request_value("Enter Value: ")
    end

    it 'receives a requested value' do
      STDOUT.stub(:print)
      STDIN.stub(:gets).and_return('25')
      subject.request_value("Enter Value: ").should == "25"
    end
  end
end
