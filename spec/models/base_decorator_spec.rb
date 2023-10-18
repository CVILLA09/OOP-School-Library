require_relative '../../decorator'

describe 'BaseDecorator' do
  let(:nameable_instance) { double('Nameable', correct_name: 'john') }
  let(:base_decorator) { BaseDecorator.new(nameable_instance) }

  it 'delegates correct_name to the wrapped object' do
    expect(base_decorator.correct_name).to eq('john')
  end
end
