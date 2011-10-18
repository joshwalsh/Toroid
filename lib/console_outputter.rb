class ConsoleOutputter
  def self.flush
    STDOUT.flush
  end

  def self.output(output)
    print output
  end

  def self.new_line
    print "\n"
  end

  def self.move_cursor_up(num_lines) 
    print "\e[#{num_lines}A\r"
  end

  def self.move_cursor_down(num_lines)
    print "\e[#{num_lines}B\r"
  end
end

