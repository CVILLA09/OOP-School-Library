# frozen_string_literal: true

require_relative 'decorator'

# This class serves to trim the name of a Person object to a maximum of 10 characters.
class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name
    name.length > 10 ? name[0..9] : name
  end
end
