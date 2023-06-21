require './base_deco.rb'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.length <= 10
      p @nameable.correct_name
    else
      trimmed_name = @nameable.correct_name[0, 10].strip
      p trimmed_name
    end
  end
end
