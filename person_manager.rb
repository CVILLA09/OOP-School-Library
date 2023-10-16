# Class responsible for person management
class PersonManager
    attr_accessor :people
  
    def initialize
      @people = []
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
  
    def create_person
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      choice = gets.chomp
      case choice
      when '1'
        create_student
      when '2'
        create_teacher
      else
        puts 'Invalid option. No person was created.'
      end
    end
  
    def create_student
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
  
      new_student = Student.new(age, name, parent_permission: parent_permission)
      @people << new_student
      puts 'Student created successfully'
    end
  
    def create_teacher
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
  
      new_teacher = Teacher.new(specialization, age, name)
      @people << new_teacher
      puts 'Teacher created successfully'
    end
  end