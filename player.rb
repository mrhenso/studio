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