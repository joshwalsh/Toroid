class PersistGame
  def self.save(game)
    File.open(self.FilePath, "w") do |file|
      file.puts YAML::dump(game)
    end

    true
  end

  def self.load
    YAML::load(File.open(self.FilePath))
  end

  def self.FilePath
    "#{Rails.root}/db/#{Rails.env}.yml"
  end
end