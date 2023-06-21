require './base_deco'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    capitalized = @nameable.correct_name.upcase
    p capitalized
  end
end
