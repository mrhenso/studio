class Patient
    attr_accessor :name1, :name2, :age, :race, :height, :weight, :city, :state, :insurance, :symptoms

    def to_s
        puts ""
        "#{@name1} #{@name2}, aged #{@age} of #{@race} race #{@height} #{@weight}. \n#{@city}, #{@state} \n#{@insurance} \nPatient is experiencing #{@symptoms}."
    end

end

class Patient_Info
    attr_reader :patient

    def initialize
        @patient = Patient.new
        @patient.name1 = info("first name").capitalize
        @patient.name2 = info("last name").capitalize
        @patient.age = info("age")
        @patient.race = info("race").capitalize
        @patient.height = info("height")
        @patient.weight = info("weight")
        @patient.city = info("city").capitalize
        @patient.state = info("state").upcase
        @patient.insurance = info("insurance").capitalize
        @patient.symptoms = info("symptoms")
    end

    def info(input)
        puts ""
        puts "What is your #{input}?"
        gets.chomp
    end
end

medical_form = Patient_Info.new
patient = medical_form.patient
puts patient