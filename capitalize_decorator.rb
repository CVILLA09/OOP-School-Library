# frozen_string_literal: true

require_relative 'decorator'

# This class serves to capitalize the name of a Person object.
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
