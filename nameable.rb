# frozen_string_literal: true

# This class provides a method for name correction but raises an error if not implemented.
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
