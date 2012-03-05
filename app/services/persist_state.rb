class PersistState
  def initialize(current_state)
    @current_state = current_state
  end

  def save(new_content)
    @current_state.write new_content 
    @current_state.rewind
  end

  def load
    @current_state.read.tap { @current_state.rewind }
  end

  def self.save(game)
    File.open(self.file_path, "w+") do |file|
      new_content = YAML::dump(game)
      new(file).save(new_content)
    end
  end

  def self.load
    content = nil

    if not File.exists?(self.file_path)
      File.open(self.file_path, "w+")
    end

    File.open(self.file_path, "r") do |game_content|
      p = PersistState.new game_content
      content = YAML::load(p.load)
    end

    content
  end

  def self.file_path
    "#{Rails.root}/db/#{Rails.env}.yml"
  end
end