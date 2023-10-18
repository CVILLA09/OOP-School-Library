require './classroom'
require './student'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Class A') }
  let(:student) { Student.new(20, 'Carlos') }
  describe 'Create a new classroom' do
    it 'Should creates a new instance of Classroom' do
      expect(classroom).to be_a(Classroom)
    end
    it 'Should initializes with the given name' do
      expect(classroom.label).to eq('Class A')
    end
    it 'Should initializes with an empty array of students' do
      expect(classroom.students).to be_empty
    end
  end
  describe 'add_student method' do
    it 'Should adds a student' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
    it 'Should sets the classroom attribute of the student to self' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
