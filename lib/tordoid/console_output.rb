module Tordoid
  module ConsoleOutput
    def flush
      STDOUT.flush
    end

    def output(output)
      STDOUT.print output
    end

    def request_value(question)
      STDOUT.print question
      STDIN.gets
    end

    def new_line(times = 1)
      STDOUT.print "\n" * times
    end

    def move_cursor_up(num_lines) 
      STDOUT.print "\e[#{num_lines}A\r"
    end

    def move_cursor_down(num_lines)
      STDOUT.print "\e[#{num_lines}B\r"
    end

  end
end
