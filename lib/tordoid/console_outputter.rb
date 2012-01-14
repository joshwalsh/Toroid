module Tordoid
  class ConsoleOutputter
    def self.flush
      STDOUT.flush
    end

    def self.output(output)
      print output
    end

    def self.request_value(question)
      print question
      gets
    end

    def self.new_line(times = 1)
      print "\n" * times
    end

    def self.move_cursor_up(num_lines) 
      print "\e[#{num_lines}A\r"
    end

    def self.move_cursor_down(num_lines)
      print "\e[#{num_lines}B\r"
    end
  end
end
