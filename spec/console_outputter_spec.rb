require 'console_outputter'

describe ConsoleOutputter do
  it "flushes the output" do
    STDOUT.should_receive(:flush)
    ConsoleOutputter.flush
  end

  context 'simple output' do
    it "writes anything given to the output" do
      ConsoleOutputter.should_receive(:print).with("Tordoid")
      ConsoleOutputter.output "Tordoid"
    end

    it "writes a new line" do
      ConsoleOutputter.should_receive(:print).with("\n")
      ConsoleOutputter.new_line
    end
  end

  context 'cursor movement' do
    it "moves the cursor up by line" do
      ConsoleOutputter.should_receive(:print).with("\e[10A\r")
      ConsoleOutputter.move_cursor_up(10)
    end

    it "moves the cursor down by line" do
      ConsoleOutputter.should_receive(:print).with("\e[10B\r")
      ConsoleOutputter.move_cursor_down(10)
    end
  end
end
