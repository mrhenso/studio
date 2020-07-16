class Project
    attr_reader :fund, :target
    attr_accessor :name
    def initialize(name, target, fund=0)
        @name = name.capitalize
        @target = target
        @fund = fund
    end
    
    def earn(usd)
        @fund += (usd)
        "#{@name} earned $#{@usd}! Total is $#{@fund}."
    end
    
    def give(usd)
        @fund -= (usd)
        "#{@name} gave $#{@usd}! Total is $#{@fund}."
    end

    def fund_needed
        @target - @fund
    end
   
    def to_s
        "#{@name}'s current fund amount is $#{@fund}. #{@name} still needs $#{fund_needed} to hit target of $#{@target}."
    end
  
end

class FundRequest
    attr_reader :name
    def initialize(name)
        @name = name
        @projects = []
    end
    
    def add_startups(a_project)
        @projects.push(a_project)
    end
    
    def request_funding
        puts "There are #{@projects.size} on-going funding projects:"
        @projects.each do |project|
        puts project
        end
        
        puts""

        @projects.each do |project|
        project.earn(500)
        puts project
        end

        puts ""

        @projects.each do |project|
            project.give(250)
            puts project
        end
     end   
end

project1 = Project.new("alpha", 5000, 200)
project2 = Project.new("beta", 5000, 100)
project3 = Project.new("zeta", 5000)

projectgiver = FundRequest.new("Project Giver")
puts projectgiver.name
projectgiver.add_startups(project1)
projectgiver.add_startups(project2)
projectgiver.add_startups(project3)
projectgiver.request_funding

# puts project3.earn(250)
# puts project3.give(50)
# puts project3
# puts project1.earn(100)
# puts project1.earn(200)
# puts project1.earn(1500)
# puts project1.give(250)

# puts ""
# projects = [project1, project2, project3]


# projects.pop
# project4 = Project.new("delta",5000,450)
# projects.push(project4)
# puts "***#{project3.name} has conceded earned funds to new entrant #{project4.name}.***"
# puts ""
# puts projects