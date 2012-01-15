class ConsoleCommand
  def initialize(command)
    @command = command.downcase
  end
  
  def terminated?
    @command == 'q'
  end
end
