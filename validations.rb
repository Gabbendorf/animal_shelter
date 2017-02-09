require_relative 'ui'

class Validations

  def initialize
    @ui = Ui.new
  end

  def validate_option_chosen(option)
    available_options = ["0", "1", "2", "3", "4", "5"]
    while option != option.to_i.to_s || available_options.include?(option) == false
      # "any letters".to_i.to_s returns always "0", whereas
      # "any numbers".to_i.to_s returns "same numbers", therefore for the former
      # the above statement is true, for the latter is false (same below)
      option = @ui.invalid_menu_option
    end
    option.to_i
  end

  def validate_age(age)
    while age != age.to_i.to_s || age <= "0"
      age = @ui.invalid_age
    end
    age.to_i
  end

  def validate_yes_replies(reply)
    while reply != "yes" && reply != "no"
      reply = @ui.yes_or_no
    end
    reply
  end

end
