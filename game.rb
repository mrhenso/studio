require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

class Game
    attr_reader :title
    
    def initialize(title)
        @title = title.capitalize
        @players = []
    end

    def load_players(from_file)
        CSV.foreach(from_file) do |row|
            player = Player.new(row[0], row[1].to_i)
            add_player(player)
        end
    end
    
    def add_player(a_player)
        @players.push(a_player)
    end
    
    def play(rounds)
        puts "\nThere are #{@players.size} players in the #{@title}:"

        @players.each do |player|
         puts player
        end
        
        treasures = TreasureTrove::TREASURES

        puts "\nThere are #{treasures.size} treasures to be found:"
            
            treasures.each do |treasure| 
                puts "A #{treasure.name} is worth #{treasure.points} points"
            end
        puts ""
       
        1.upto(rounds) do |round|
            puts "\nRound #{round}:"
            @players.each do |player|
            GameTurn.take_turn(player)
            puts player
            end
        end
        puts ""

        


    end

    def print_name_and_health(player)
        puts "#{player.name} (#{player.health})"
    end

    def print_stats

        strong_players, wimpy_players = @players.partition {|player| player.strong?}
        
        @players.each do |player|
            puts "\n#{player.name}'s point totals:"
            puts "\n#{player.points} grand total points"
        end
        
        puts "\n#{@title} Statistics:"
        
        puts "\n#{strong_players.size} Strong Players:"
        strong_players.each do |player|
            print_name_and_health(player)
        end

        puts "\n#{wimpy_players.size} Wimpy Players"
        wimpy_players.each do |player|
            print_name_and_health(player)
        end

        
        puts "\n#{@title} High Scores:"
            @players.sort.each do |player|
            puts high_score_entry(player)
        end
    end

    def save_high_scores(to_file="high_scores.txt")
        File.open(to_file, "w") do |file|
            file.puts "#{@title} High Scores:"
            @players.sort.each do |player|
            file.puts high_score_entry(player)
            end
        end
    
    end

    def high_score_entry(player)
        formatted_name = player.name.ljust(20,".")
        "#{formatted_name} #{player.score}"
    end
end