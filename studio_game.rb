require_relative 'player'
require_relative 'game'



player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

# players.pop
# player4 = Player.new("Shemp" ,90)
# players.push(player4)
# puts players
player1a = Player.new("alvin")
player2a = Player.new("simon", 100)
player3a = Player.new("theodore", 50)

chipmunks = Game.new("Chipmunks")
chipmunks.add_player(player1a)
chipmunks.add_player(player2a)
chipmunks.add_player(player3a)
chipmunks.play