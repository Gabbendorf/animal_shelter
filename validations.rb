require_relative 'ui'

class Validations

  def initialize(ui)
    @ui = ui
  end

  def validate_option_chosen(option)
    available_options = ["0", "1", "2", "3", "4", "5"]
    while option != option.to_i.to_s || !available_options.include?(option)
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

  def validate_email_address(email_address)
    while !email_address.include?("@") || !email_address.include?(".")
      email_address = @ui.invalid_email_address
    end
    email_address
  end

  def validate_date_of_birth(date_of_birth)
    while !date_of_birth.include?("/") || date_of_birth.length != 10
      date_of_birth = @ui.invalid_date_of_birth
    end
    date_of_birth
  end

end
