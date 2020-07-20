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