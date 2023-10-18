require 'json'
require './student'

RSpec.describe Student do
  let(:student) { Student.new(20, "Felipe")}

  describe 'Create a new student' do
    it 'Should creates a new instance of Student' do 
      expect(student).to be_a(Student)
    end

    it 'Should have a name and age' do 
      expect(student.age).to eq(20)
      expect(student.name).to eq("Felipe")
    end
  end

  describe 'Load data from json' do
    it 'Should return the student from json' do
      json = student.to_json
      expect { JSON.parse(json) }.not_to raise_error
      parsed_json = JSON.parse(json)
      expect(parsed_json['JSON_CLASS']).to eq('Student')
      expect(parsed_json['age']).to eq(20)
      expect(parsed_json['name']).to eq('Felipe')
    end
  end

  describe 'Save data to json' do
    it 'Should save a new student' do
      json = {
        'JSON_CLASS' => 'Student',
        'age' => 20,
        'name' => 'Cristian'
      }.to_json

      new_student = Student.new_from_json(JSON.parse(json))
      expect(new_student).to be_a(Student)
      expect(new_student.age).to eq(20)
      expect(new_student.name).to eq('Cristian')
    end
  end
end