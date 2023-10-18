require_relative '../../trimmer_decorator'

describe 'TrimmerDecorator' do
  let(:nameable_instance) { double('Nameable', correct_name: 'verylongname') }
  let(:trimmer_decorator) { TrimmerDecorator.new(nameable_instance) }

  it 'trims the name to 10 characters' do
    expect(trimmer_decorator.correct_name).to eq('verylongna')
  end
end
