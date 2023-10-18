require_relative '../../capitalize_decorator'

describe 'CapitalizeDecorator' do
  let(:nameable_instance) { double('Nameable', correct_name: 'john') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(nameable_instance) }

  it 'capitalizes the name' do
    expect(capitalize_decorator.correct_name).to eq('John')
  end
end
