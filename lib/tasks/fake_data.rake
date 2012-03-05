task :fake_data  => :environment do
  game = Game.new
  game.year = 1

  p = Planet.new(game)
  p.name = "Earth"
  p.width = 10
  p.height = 10

  game.planets << p

  PersistState.save game
end