task :fake_data  => :environment do
  p = Planet.new
  p.name = "Earth"
  p.save

  josh = Organism.new
  josh.name = "Josh"
  josh.x = 2
  josh.y = 3

  joe = Organism.new
  joe.name = "Joe"
  joe.x = 5
  joe.y = 8

  jon = Organism.new
  jon.name = "Jonathan"
  jon.x = 3
  jon.y = 9

  p.organisms << josh
  p.organisms << joe
  p.organisms << jon
end