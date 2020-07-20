class Game
    attr_accessor :name, :console, :genre, :players, :ratings

    def to_s
        puts""
    "#{@name} is playable on #{@console} and falls under #{@genre}. Supports up to #{@players} players and has a rating of #{@ratings}."
    end

end

class Summary
attr_reader :game
    def initialize
        @game = Game.new
        @game.name = ask("name").capitalize
        @game.console = ask("console").capitalize
        @game.genre = ask("genre").capitalize
        @game.players = ask("players")
        @game.ratings = ask("ratings")
    end

    def ask(input)
        puts ""
        puts "What is the #{input} of the game?"
        gets.chomp
    end
end

game_info = Summary.new
game = game_info.game
puts game