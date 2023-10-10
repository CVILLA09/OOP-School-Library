require_relative 'nameable'

# This class serves as the base decorator for other specific decorators.
class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
