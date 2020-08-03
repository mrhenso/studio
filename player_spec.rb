require_relative 'player'
require_relative 'game'
require_relative 'spec_helper'
require_relative 'treasure_trove'

describe 'player' do
    before do
        @initial_health = 150
        @player = Player.new("larry", @initial_health)
    
    end
    before do
        $stdout = StringIO.new
    end
    
    it "has a capitalized name" do
        expect(@player.name).to eq("Larry")
    end

    it "has an initial health" do
        expect(@player.health).to eq(150)
    end

    it "has a string representation" do
       expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
    end

    it "computes a score as a sum of its health and length of name" do
       expect(@player.score).to eq(150 + 5)
    end
        
    it "increases health by 15 when w00ted" do
        @player.w00t
        expect(@player.health).to eq(@initial_health +15)
    end
    it "decreases health by 10 when blammed" do
        @player.blam
        expect(@player.health).to eq(@initial_health - 10)
    end

    context "with a health greater than 100" do
        before do
            @player = Player.new("larry", 150)
        end
        it "is strong" do
            @player.should be_strong
        end
        
    end

    context "with a health of 100 or less" do
        before do
            @player = Player.new("larry", 100)
        end
        it "is wimpy" do
            @player.should_not be_strong
        end
    end

    it "computes points as the sum of all treasure points" do
        expect(@player.points).to eq(0)
        expect(@player.found_treasure).to eq(Treasure.new("hammer", 50))
        expect(@player.points).to eq(50)
        expect(@player.found_treasure).to eq(Treasure.new("crowbar", 400))
        expect(@player.points).to eq(450)
        expect(@player.found_treasure).to eq(Treasure.new("hammer", 50))
        expect(@player.points).to eq(500)
        
    end

    it "assigns a treasure for points during a player's turn" do
        game = Game.new("Knuckleheads")
        player = Player.new("moe")
        game.add_player(player)
        game.play(1)
        expect(player.points).to_not eq(0)
    end
    
    
    it "can be created from a CSV string" do
    player = Player.from_csv("larry,150")
    
    expect(player).to eq("larry")
    expect(health).to eq(150)
    end
    
end
