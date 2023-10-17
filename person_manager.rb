require 'json'

# Class responsible for person management
class PersonManager
  attr_accessor :people

  def initialize
    @people = []
    load_people_from_json if File.exist?('people.json')
  end

  def load_people_from_json
    json_data = File.read('people.json')
    array_of_strings = JSON.parse(json_data)
    
    array_of_strings.each do |string|
      hash = JSON.parse(string)
      json_class = hash['JSON_CLASS']
  
      person = nil
  
      if json_class == 'Student'
        person = Student.new_from_json(hash)
      elsif json_class == 'Teacher'
        person = Teacher.new_from_json(hash)
      end
  
      @people << person unless person.nil?
    end
  end  

  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'List of all people:'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person(choice, age, name, additional_info)
    case choice
    when '1'
      create_student(age, name, additional_info)
    when '2'
      create_teacher(age, name, additional_info)
    else
      puts 'Invalid option. No person was created.'
    end
  end

  def create_student(age, name, parent_permission)
    new_student = Student.new(age, name, parent_permission: parent_permission)
    @people << new_student
    puts 'Student created successfully'
  end

  def create_teacher(age, name, specialization)
    new_teacher = Teacher.new(specialization, age, name)
    @people << new_teacher
    puts 'Teacher created successfully'
  end

  def save_people_to_json
    File.open('people.json', 'w') do |f|
      data_to_write = @people.map(&:to_json).to_json
      f.write(data_to_write)
    end
  end 
end
