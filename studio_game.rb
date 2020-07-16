class Player
attr_reader :health
attr_accessor :name


    def initialize(name, health=100)
        @name = name.capitalize
        @health = health
    end
    def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score}."
    end
    def blam
        @health -= 10
        puts "#{@name} got blammed! #{@name}'s health is now #{@health}."
    end
    def w00t
        @health += 15
        puts "#{@name} got w00ted! #{@name}'s health is now #{@health}."
    end
    
    def score
        @health + @name.length
    end

    def name=(new_name)
        @name = new_name.capitalize
    end

end

class Game
attr_reader :title
    def initialize(title)
        @title = title.capitalize
        @players = []
    end
    def add_player(a_player)
        @players.push(a_player)
    end
    def play
        puts "There are #{@players.size} players in the #{@title}:"
            @players.each do |player|
                puts player
            end
            
        puts ""

            @players.each do |player|
                player.blam
                player.blam
                puts player
                puts ""
            end
        
        puts ""
             
            @players.each do |player|
                    player.w00t
                    puts player
                    puts ""
            end
    end
end


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