require 'json'
require './teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new('Math', 45, 'Nancy') }

  describe 'Create a new teacher' do
    it 'Should creates a new instance of teacher' do
      expect(teacher).to be_a(Teacher)
    end

    it 'Should have a specialization, name and age' do
      expect(teacher.specialization).to eq('Math')
      expect(teacher.age).to eq(45)
      expect(teacher.name).to eq('Nancy')
    end
  end

  describe 'Can she use services?' do
    it 'Should use services' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end

  describe 'Load data from json' do
    it 'Should return the teacher from json' do
      json = teacher.to_json
      expect { JSON.parse(json) }.not_to raise_error
      parsed_json = JSON.parse(json)
      expect(parsed_json['JSON_CLASS']).to eq('Teacher')
      expect(parsed_json['specialization']).to eq('Math')
      expect(parsed_json['age']).to eq(45)
      expect(parsed_json['name']).to eq('Nancy')
    end
  end

  describe 'Save data to json' do
    it 'Should save a new teacher' do
      json = {
        'JSON_CLASS' => 'Teacher',
        'specialization' => 'History',
        'age' => 60,
        'name' => 'Paolo'
      }.to_json

      new_teacher = Teacher.new_from_json(JSON.parse(json))
      expect(new_teacher).to be_a(Teacher)
      expect(new_teacher.specialization).to eq('History')
      expect(new_teacher.age).to eq(60)
      expect(new_teacher.name).to eq('Paolo')
    end
  end
end
